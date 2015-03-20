//
//  IAABook.h
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IAABook : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSArray *authors;
@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSURL *bookCoverURL;
@property (strong, nonatomic) NSURL *bookPDFURL;


//iniciador designado
-(id) initWithTitle: (NSString *) aTitle
            authors: (NSArray *)  arrayOfAuthors
               tags: (NSArray *)  arrayOfTags
       bookCoverURL: (NSURL *) aBookCoverURL
         bookPDFURL: (NSURL *) aBookPDFURL;

//iniciador de conveniencia
-(id) initWithTitle: (NSString *) aTitle;

//inicializador a partir de un diccionario JSON
-(id) initWithDictionary: (NSDictionary *) aDict;

@end
