//
//  IAALibraryTableViewController.m
//  HackerBooks
//
//  Created by Ivan on 12/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAALibraryTableViewController.h"
#import "IAABook.h"
#import "IAABookViewController.h"
#import "IAALibraryCellTableViewCell.h"
#import "IAATag.h"

@interface IAALibraryTableViewController ()

@end

@implementation IAALibraryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.title=@"HackerBooks 2";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IAATag *t= [self.fetchedResultsController objectAtIndexPath:indexPath];
  
    //averiguamos cual es el libro
    //IAABook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
    IAABook *b = [[t.books allObjects] lastObject];
    
    // Crear una celda
    
    static NSString *CustomCellIdentifier = @"CustomCellIdentifier ";
    IAALibraryCellTableViewCell *cell = (IAALibraryCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier: CustomCellIdentifier];
    
    
    
    /*
    static NSString *cellID = @"bookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:cellID];
    }
    */
     
     // Configuramos la celda...
     if (cell == nil)
     {
     NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"IAALibraryCellTableViewCell" owner:self options:nil];
     cell = (IAALibraryCellTableViewCell *)[nib objectAtIndex:0];
     }

    
    
    //sincronizamos vista y modelo
    cell.bookTitle.text=b.title;
    cell.bookAuthors.text = b.authors;
    cell.bookCoverImage.image = [UIImage imageNamed:@"bookCover.jpg"];
    
    //cargamos la imagen
    
    [cell.activityIndicator startAnimating];
    
    // crear un cola
    dispatch_queue_t loadCovers = dispatch_queue_create("loadCovers", 0);
    
    
    dispatch_async(loadCovers, ^{
        UIImage *img= b.imageBookCover;
        
        
        // se ejecuta en primer plano
        dispatch_async(dispatch_get_main_queue(), ^{
           cell.bookCoverImage.image=img;
            
            [cell.activityIndicator stopAnimating];
            
        });
    });
    
    
    
    return cell;
    
    
    
    
    
    
    // Devolverla
    return cell;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    IAATag *t= [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //averiguamos cual es el libro
    //IAABook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
    IAABook *book = [[t.books allObjects] lastObject];

    
    // Crear el controlador
 /*   IAABookViewController *bookVC = [[IAABookViewController alloc] initWithBook:book];
    
    // Hacer un push
    [self.navigationController pushViewController:bookVC
   animated:YES];
   */
    
    // Avisar al delegado
    [self.delegate IAALibraryTableViewController:self didSelectBook:book];
    
    
    //mandamos una notificacion
    
 //   NSNotification *notificationSelectNewCharacter = [NSNotification notificationWithName:DID_SELECT_NEW_BOOK_NOTIFICATION_NAME object:self                                                                                 userInfo:@{@"NEW_BOOK": book}];
    
 //   [[NSNotificationCenter defaultCenter] postNotification:notificationSelectNewCharacter];
    
    
    /*
     //creamos la nueva vista y le pasamos el libro
     IAABookViewController *bookVB = [[IAABookViewController alloc]initWithBook:book];
     
     [self.navigationController pushViewController:bookVB animated:YES];
     
     */
    
  //  [self saveLastSelectedBookAtSection:indexPath.section
                   //                 row:indexPath.row];
}

#pragma mark -  IAALibraryTableViewControllerDelegate

-(void) IAALibraryTableViewController: (IAALibraryTableViewController *) aLibraryVC
                        didSelectBook:(IAABook *) aBook
{
    // Crear el controlador
    IAABookViewController *bookVC = [[IAABookViewController alloc] initWithBook:aBook];

    
    // Hacer un push
    [self.navigationController pushViewController:bookVC
                                         animated:YES];
}

#pragma mark -  NSUserDefaults

- (NSDictionary *)setDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Por defecto, mostraremos el primero de la seccion de libros (obviando la de favoritos por si no hubiera aun ninguno)
    NSDictionary *defaultBooksCoords = @{@"SECTION" : @0, @"ROW" : @0};
    
    // lo asignamos
   // [defaults setObject:defaultBooksCoords
    //             forKey:@"LAST_BOOK_SELECTED"];
    // guardamos por si las moscas
   // [defaults synchronize];
    
    return defaultBooksCoords;
    
}

- (void)saveLastSelectedBook:(IAABook*)book
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:book.archiveURIRepresentation
                 forKey:@"LAST_BOOK_SELECTED"];
    
    [defaults synchronize];
}

// Tries to recover the object from the archived URI representation (that probably
// comes from some NSUserDefaults). If the object doesn't exist anymore, returns
// nil.
-(IAABook *) objectWithArchivedURIRepresentation:(NSData*)archivedURI
                                            context:(NSManagedObjectContext *) context{
    
    NSURL *uri = [NSKeyedUnarchiver unarchiveObjectWithData:archivedURI];
    if (uri == nil) {
        return nil;
    }
    
    
    NSManagedObjectID *nid = [context.persistentStoreCoordinator
                              managedObjectIDForURIRepresentation:uri];
    if (nid == nil) {
        return nil;
    }
    
    
    NSManagedObject *ob = [context objectWithID:nid];
    if (ob.isFault) {
        // Got it!
        return (IAABook *)ob;
    }else{
        // Might not exist anymore. Let's fetch it!
        NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:ob.entity.name];
        req.predicate = [NSPredicate predicateWithFormat:@"SELF = %@", ob];
        
        NSError *error;
        NSArray *res = [context executeFetchRequest:req
                                              error:&error];
        if (res == nil) {
            return nil;
        }else{
            return [res lastObject];
        }
    }
    
    
}

- (IAABook *)lastSelectedBookWithContext:(NSManagedObjectContext *) context;

{
    NSIndexPath *indexPath = nil;
    NSDictionary *coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:@"LAST_BOOK_SELECTED"];
    
    if (coords == nil) {
        // No hay nada bajo la clave LAST_BOOK_SELECTED.
        // Esto quiere decir que es la primera vez que se llama a la App
        // Ponemos un valor por defecto: el primero de los libros del listado de Tags
        coords = [self setDefaults];
        
        // Transformamos esas coordenadas en un indexpath
        indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey: @"ROW"] integerValue]
                                       inSection:[[coords objectForKey: @"SECTION"] integerValue]];

        IAATag *t= [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //averiguamos cual es el libro
        //IAABook *b = [self.fetchedResultsController objectAtIndexPath:indexPath];
        IAABook *book = [[t.books allObjects] lastObject];

        return book;
        
        
    }else{
        
        return [self objectWithArchivedURIRepresentation:coords context:context];
    }
    

    
    // devolvemos el libro en cuestión
    
    IAABook *book =nil;
    
    //book=[self.modelLibrary bookForTag:[self.modelLibrary tagAtIndex:indexPath.section-1] atIndex:indexPath.row];
    
    
    
    
    return book;
}
@end
