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

@end

@implementation IAALibraryModel


//sobreescribimos el inicializador para descargar la info del JSON

- (id) init
{
    if (self = [super init])
    {
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"]];
        NSURLResponse *response = [[NSURLResponse alloc]init];
        NSError *error;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if (data!=nil)
        {
            NSArray *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
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
                        else{
                            [self.books addObject:book];
                        }
                        
                        //asigno el libro al los distintos listados de etiquetas que le corresponden
                        [self asignToTagsArray: book];
                                               
                    }
                    
                }
            }
            else
            {
                // Se ha producido un error al parsear el JSON
                NSLog(@"Error al parsear JSON: %@", error.localizedDescription);
            }
        }
        else
        {
            // Error al descargar los datos del servidor
            NSLog(@"Error al descargar datos del servidor: %@", error.localizedDescription);
        }
    }
    return self;
    
}

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
@end
