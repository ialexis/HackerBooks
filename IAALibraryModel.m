//
//  IAALibraryModel.m
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAALibraryModel.h"

@interface IAALibraryModel ()

@property (strong,nonatomic) NSMutableDictionary* tagsDict;
@property (strong,nonatomic) NSMutableArray* books;
@property (strong,nonatomic) NSMutableArray* favoriteBooks;
@property (strong,nonatomic) NSUserDefaults *defaults;

@end

@implementation IAALibraryModel


//sobreescribimos el inicializador para descargar la info del JSON

- (id) init
{
    if (self = [super init])
    {
        NSArray *JSONObjects = [self recoverJSON: [NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
        if (JSONObjects!=nil)
        {
            for (NSDictionary *dict in JSONObjects)
            {
                //nos aseguramos que el formato del JSON incluye el titulo para evitar algun posible libro en blanco
                if  ([dict objectForKey:@"title"]!=nil)
                {
                    //cargo el libro
                    IAABook *book = [[IAABook alloc]initWithDictionary:dict];
                        
                    //almaceno el libro en el array de libros
                    if (!self.books)
                    {
                        self.books = [NSMutableArray arrayWithObject:book];
                    }
                    else
                    {
                        [self.books addObject:book];
                    }
                        
                    //asigno el libro al los distintos listados de etiquetas que le corresponden
                    [self asignToTagsArray: book];
                }
            }
        }
        
        //una vez cargados todos los libros, cargamos los que hay en favoritos
        [self loadFavorites];
    }
    return self;
}

#pragma mark - JSON
-(NSArray *) recoverJSON: (NSURL *) aURL
{
    //primera ejecucion del programa, descargamos a local JSON
    //vemos cual es la ruta fisica del directorio de cache
    
    self.defaults = [NSUserDefaults standardUserDefaults];
    
    if ([self.defaults objectForKey:@"firstExecutionDone"]==nil)
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
        [self.defaults setObject:@"DONE"
                     forKey: @"firstExecutionDone"];
        
        [self.defaults synchronize];
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


#pragma mark - utils


-(void) asignToTagsArray: (IAABook*) aBook
{
    for (NSString *tag in aBook.tags)
    {
        NSMutableArray *booksWithTag = [self.tagsDict objectForKey:tag];

        if (!booksWithTag)
        {
            booksWithTag = [[NSMutableArray alloc]init];
        }
        
        [booksWithTag addObject:aBook];
    
        if (self.tagsDict == nil)
        {
            self.tagsDict= [[NSMutableDictionary alloc]init];
        }
        [self.tagsDict setObject:booksWithTag forKey:tag];
    }
}

/*-(IAABook *) bookAtIndex: (NSUInteger) index{
    return nil;
}
-(NSMutableArray *) booksAtTitle: (NSString *) title{
    return nil;
}
-(NSMutableArray *) booksAtTag: (NSString *) tag{
    return nil;
}*/

//cantidad de libros
-(NSUInteger) booksCount
{
    return [self.books count];
}
// Array inmutable (NSArray) con todas las
// distintas temáticas (tags) en orden alfabético.
// No puede bajo ningún concepto haber ninguna
-(NSArray*) tags
{
    return [[self.tagsDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

// Cantidad de libros que hay en una temática.
// Si el tag no existe, debe de devolver cero
-(NSUInteger) bookCountForTag:(NSString*) tag
{
    NSArray* booksWithTagArray = [self.tagsDict objectForKey:tag];
    
    if (!booksWithTagArray)
    {
        return 0;
    }
    else
    {
        return [booksWithTagArray count];
    }
}


// Array inmutable (NSArray) de los libros
// (instancias de AGTBook) que hay en
// una temática.
// Un libro puede estar en una o más
// temáticas. Si no hay libros para una
// temática, ha de devolver nil.
-(NSArray*) booksForTag: (NSString *) tag
{
    NSArray* booksWithTagArray = [self.tagsDict objectForKey:tag];
    
    if (!booksWithTagArray)
    {
        return nil;
    }
    else
    {
        return booksWithTagArray;
    }

}


//Un AGTBook para el libro que está en la posición
//'index' de aquellos bajo un cierto
//tag. Mira a ver si puedes usar el método anterior
//para hacer parte de tu trabajo.
// Si el indice no existe o el tag no existe, ha de devolver nil.
-(IAABook*) bookForTag:(NSString*) tag atIndex:(NSUInteger) index
{
    return [[self booksForTag:tag] objectAtIndex:index];
}



//Tag en una posicion
-(NSString *) tagAtIndex: (NSInteger)index
{
    return [self.tags objectAtIndex:index];
}


-(NSUInteger) countOfTags
{
    return [self.tags count];
}


#pragma mark - Favorites

//recupera la lista de libros favoritos
-(void)loadFavorites
{
    NSUserDefaults *defaults= [NSUserDefaults standardUserDefaults];
    NSDictionary *favoriteDic = [defaults objectForKey:@"favorites"];
    self.favoriteBooks=[[NSMutableArray alloc]init];
    for(id key in favoriteDic) {
        [self.favoriteBooks addObject:key];
    }
    self.favoriteBooks = [defaults objectForKey:@"favorites"];
}
//recupera un libro de favoritos
-(IAABook*) bookForFavoriteAtIndex:(NSUInteger) index
{
    return [self.favoriteBooks objectAtIndex:index];
}

//Cantidad de libros favoritos
-(NSUInteger) countOfFavorites
{
    return [self.favoriteBooks count];
}
@end
