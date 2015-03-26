//
//  IAABook.h
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IAABook : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSURL *bookCoverURL;
@property (strong, nonatomic) NSURL *bookPDFURL;
@property (strong, nonatomic,readonly) UIImage *bookCover;
@property (strong, nonatomic,readonly) NSData  *bookPDF;
@property (nonatomic) BOOL isFavorite;


#define DID_SELECT_FAVORITE_BOOK_NOTIFICATION_NAME @"newFavoriteBookSelected"



//iniciador designado
-(id) initWithTitle: (NSString *) aTitle
            authors: (NSArray *)  arrayOfAuthors
               tags: (NSArray *)  arrayOfTags
       bookCoverURL: (NSURL *) aBookCoverURL
         bookPDFURL: (NSURL *) aBookPDFURL
         isFavorite: (BOOL) aIsFavorite;

//iniciador de conveniencia
-(id) initWithTitle: (NSString *) aTitle;


//inicializador a partir de un diccionario JSON marcando como favoritos los libros favoritos
-(id) initWithDictionary: (NSDictionary *) aDict andMarkAsFavorite: (BOOL) aIsFavorite;

//inicializador a partir de un diccionario JSON
-(id) initWithDictionary: (NSDictionary *) aDict;


//Marca un libro como favorito
-(void) markAsFavoriteWithValue: (BOOL) value;

@end
