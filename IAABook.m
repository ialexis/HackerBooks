//
//  IAABook.m
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAABook.h"

@implementation IAABook


#pragma mark - inicializadores

//iniciador designado
-(id) initWithTitle: (NSString *) aTitle
            authors: (NSArray *)  arrayOfAuthors
               tags: (NSArray *)  arrayOfTags
       bookCoverURL: (NSURL *) aBookCoverURL
         bookPDFURL: (NSURL *) aBookPDFURL{
    if (self=[super init]) {
        _title = aTitle;
        _authors=arrayOfAuthors;
        _tags=arrayOfTags;
        _bookCoverURL=aBookCoverURL;
        _bookPDFURL=aBookPDFURL;
    }
    return self;
}

//iniciador de conveniencia
-(id) initWithTitle: (NSString *) aTitle
{
    return [self initWithTitle:aTitle authors:nil tags:nil bookCoverURL:nil bookPDFURL:nil];
}


#pragma mark - inicializador JSON
-(id)initWithDictionary:(NSDictionary *)aDict
{
    return [self initWithTitle:[aDict objectForKey:@"title"]
                       authors:[self extractAuthorsFromJSONString:[aDict objectForKey:@"authors"]]
                          tags:[self extractTagsFromJSONString:[aDict objectForKey:@"tags"]]
                  bookCoverURL:[aDict objectForKey:@"image_url"]
                    bookPDFURL:[aDict objectForKey:@"pdf_url"]];
}
-(NSArray *) extractAuthorsFromJSONString:(NSString *) JSONAuthorsString
{
      NSArray *authors = [JSONAuthorsString componentsSeparatedByString:@", "];

    return authors;
}
-(NSArray *) extractTagsFromJSONString:(NSString *) JSONTagsString
{
    NSArray *tags= [JSONTagsString componentsSeparatedByString:@", "];
    return tags;
}
@end