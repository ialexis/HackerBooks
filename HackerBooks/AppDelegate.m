//
//  AppDelegate.m
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "UIViewController+Navigation.h"
#import "IAABook.h"
#import "IAATag.h"
#import "Settings.h"
#import "IAABookViewController.h"
#import "IAALibraryTableViewController.h"

@interface AppDelegate ()

@property (nonatomic,strong)AGTCoreDataStack *stack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // Override point for customization after application launch.
    
    
    
    //creamos una instancia del stack
    
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    [self.stack zapAllData];
    
    //cargamos los datos del JSON
    [self loadJSONData];
    
    [self autosave];
    
   
    
    // Un fetchRequest
 //   NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[IAABook entityName]];
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[IAATag entityName]];
 
//    req.sortDescriptors = @[[NSSortDescriptor
//                             sortDescriptorWithKey:IAABookAttributes.title
//                             ascending:YES
//                             selector:@selector(caseInsensitiveCompare:)]];
   req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:IAATagAttributes.priority
                             ascending:NO
                             selector:nil],[NSSortDescriptor
                                                                           sortDescriptorWithKey:IAATagAttributes.tag
                                                                           ascending:YES
                                                                           selector:@selector(caseInsensitiveCompare:)]];
/*  req.sortDescriptors = @[[NSSortDescriptor
                                                                           sortDescriptorWithKey:IAATagAttributes.tag
                                                                           ascending:YES
                                                                           selector:@selector(caseInsensitiveCompare:)]];*/
    req.fetchBatchSize = 20;
    
    // FetchedResultsController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:self.stack.context
                                      sectionNameKeyPath:IAATagAttributes.tag
                                      cacheName:nil];

    
    //Creamos el controlador
    
   // IAALibraryTableViewController *lVC = [[IAALibraryTableViewController alloc]initWithFetchedResultsController:fc style:UITableViewStylePlain];
    

    //miramos en que dispositivo estamos
    UIViewController *rootVC = nil;
    
   //     rootVC=lVC;
    
    
    if ([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPad)
    {
        //pantalla grande
        
        rootVC=[self rootViewControllerForPadWithModel:fc];
        
    }
    
    else{
        //pantalla pequeña
        rootVC=[self rootViewControllerForPhoneWithModel:fc];
        
    }
    
    
    //asignamos el split como controlador raiz
    self.window.rootViewController = rootVC;

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


-(UIViewController *) rootViewControllerForPhoneWithModel: (NSFetchedResultsController *)fc
{
    //Creamos el controlador
    
    IAALibraryTableViewController *lVC = [[IAALibraryTableViewController alloc]initWithFetchedResultsController:fc style:UITableViewStylePlain];

    
    //Creamos un navigation controller para cada controlador
    
  //  UINavigationController *navLibraryVC = [[UINavigationController alloc]initWithRootViewController:libraryVC];

    lVC.delegate=lVC.self;
    
    return [lVC wrappedInNavigation];
}

- (UIViewController *)rootViewControllerForPadWithModel: (NSFetchedResultsController *)fc

{
    // Controladores
    IAALibraryTableViewController *lVC = [[IAALibraryTableViewController alloc]initWithFetchedResultsController:fc style:UITableViewStylePlain];

    
   // IAABookViewController *bookVC = [[IAABookViewController alloc] initWithBook:[lVC lastSelectedBook]];
     IAABookViewController *bookVC = [[IAABookViewController alloc] initWithBook:[lVC lastSelectedBookWithContext:self.stack.context]];
    
    // Combinadores
    UINavigationController *BookNav = [[UINavigationController alloc] initWithRootViewController:bookVC];
    
    UINavigationController *libraryNav = [[UINavigationController alloc] initWithRootViewController:lVC];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[libraryNav, BookNav];
    
    //añadirmos esta linea para que muestre el boton del splitview cuando este en horizontal.
    BookNav.topViewController.navigationItem.leftBarButtonItem = splitVC.displayModeButtonItem;

    
    // Delegados
    splitVC.delegate = bookVC;
    lVC.delegate = bookVC;
    
    return splitVC;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - JSON

-(void)loadJSONData
{
    NSArray *JSONObjects = [self recoverJSON: [NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
    if (JSONObjects!=nil)
    {
        for (NSDictionary *dict in JSONObjects)
        {
            //nos aseguramos que el formato del JSON incluye el titulo para evitar algun posible libro en blanco
            if  ([dict objectForKey:@"title"]!=nil)
            {
                //miro si es un libro favorito
               // BOOL isFavoriteBook = !![self.favoriteBooksTitles objectForKey:[dict objectForKey:@"title"]];
                //cargo el libro
                //IAABook *book = [IAABook bookWithTitle:[dict objectForKey:@"title"] context:self.stack.context];
                [IAABook bookWithDictionary:dict context:self.stack.context];
                
                //  else
                //  {
                //      [self.books addObject:book];
                //  }
                
                //asigno el libro al los distintos listados de etiquetas que le corresponden
               // [self asignToTagsArray: book];
            }
        }
    }
}

-(NSArray *) recoverJSON: (NSURL *) aURL
{
    //primera ejecucion del programa, descargamos a local JSON
    //vemos cual es la ruta fisica del directorio de cache
    
 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"firstExecutionDone"]==nil)
    {
        if (![self fistExecutionWithURL:aURL])
        {
            // Si no ha terminado bien la primera ejecucion Error al descargar los datos del servidor
            return nil;
        }
    }
    
    
    
    
    //NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    
    NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:aURL]];
    
    NSError *error;
    
    if (data!=nil)
    {
        NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (JSONObjects==nil)
        {
            // Se ha producido un error al parsear el JSON
            NSLog(@"Error al parsear JSON: %@", error.localizedDescription);
        }
        
        return JSONObjects;
    }
    else
    {
        return nil;
    }
}

#pragma mark - NSUsersDefaults

- (NSData *) fistExecutionWithURL:(NSURL *) aURL
{
    
    //averiguamos el directorio de documentos de la aplicacion
    NSString *fileName = [self discoverFileName:aURL];
    
    //descargamos el JSON desde internet y lo guardamos en local
    
    
    
    /* NSURLRequest *request=[NSURLRequest requestWithURL:aURL];
     NSURLResponse *response = [[NSURLResponse alloc]init];
     NSError *error;
     NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
     //NSData *data =[NSData dataWithContentsOfURL:aURL];*/
    
    
    NSError *error = nil; // This so that we can access the error if something goes wrong
    NSData *data = [NSData dataWithContentsOfURL:aURL options:NSDataReadingMappedIfSafe error:&error];
    
    
    if (data!=nil)
    {
        //guardamos el JSON en local
        [data writeToFile:fileName atomically:TRUE];
        
        
        //marcamos default como que ya se ha realizado la primera ejecucion
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"DONE"
                          forKey: @"firstExecutionDone"];
        
        [defaults synchronize];
        return data;
    }
    else
    {
        // Error al descargar los datos del servidor
        NSLog(@"Error al descargar datos del servidor: %@", error.localizedDescription);
        return nil;
    }
    
}
- (NSString *) discoverFileName: (NSURL *) aURL
{
    //vemos cual es la ruta fisica del directorio de cache
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory=[paths objectAtIndex: 0];
    
    //sacamos el nombre teorico que tendria el fichero imagen si estuviera grabado.
    
    NSString *nombreFichero = [aURL absoluteString];
    
    nombreFichero = [[[nombreFichero stringByReplacingOccurrencesOfString:@"/"withString:@"_"]stringByReplacingOccurrencesOfString:@":" withString:@"_"]stringByReplacingOccurrencesOfString:@"www." withString:@"www_"];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/%@",cachesDirectory,nombreFichero];
    
    return fileName;
}

- (void) save
{
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %s \n\n %@",__func__,error);
    }];
}
-(void) autosave
{
  if (AUTO_SAVE)
  {
      NSLog(@"Autoguardando...");
      [self save];
      [self performSelector:@selector(autosave) withObject:nil afterDelay:AUTO_SAVE_DELAY_IN_SECONDS];
  }
}

@end
