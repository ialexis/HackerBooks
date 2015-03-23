//
//  IAALibraryModel.h
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAABook.h"

@interface IAALibraryModel : NSObject

//-(IAABook *) bookAtIndex: (NSUInteger) index;
//-(NSMutableArray *) booksAtTitle: (NSString *) title;
//-(NSMutableArray *) booksAtTag: (NSString *) tag;



//Número total de libros
-(NSUInteger) booksCount;

// Array inmutable (NSArray) con todas las
// distintas temáticas (tags) en orden alfabético.
// No puede bajo ningún concepto haber ninguna
-(NSArray*) tags;

// Cantidad de libros que hay en una temática.
// Si el tag no existe, debe de devolver cero
-(NSUInteger) bookCountForTag:(NSString*) tag;

// Array inmutable (NSArray) de los libros
// (instancias de AGTBook) que hay en
// una temática.
// Un libro puede estar en una o más
// temáticas. Si no hay libros para una // temática, ha de devolver nil.
-(NSArray*) booksForTag: (NSString *) tag;


//Un AGTBook para el libro que está en la posición
//'index' de aquellos bajo un cierto
//tag. Mira a ver si puedes usar el método anterior
//para hacer parte de tu trabajo.
// Si el indice no existe o el tag no existe, ha de devolver nil.
-(IAABook*) bookForTag:(NSString*) tag atIndex:(NSUInteger) index;

//cantidad de Tags que hay en la libreria
-(NSUInteger) countOfTags;

//Tag en una posicion
-(NSString *) tagAtIndex: (NSInteger)index;

//Cantidad de libros favoritos
-(NSUInteger) countOfFavorites;

//recupera un libro de favoritos
-(IAABook*) bookForFavoriteAtIndex:(NSUInteger) index;

//recupera la lista de libros favoritos
-(void)loadFavorites;
@end
