//
//  IAABook.m
//  HackerBooks
//
//  Created by Ivan on 20/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAABook.h"

@implementation IAABook

@synthesize bookCover=_bookCover;
@synthesize bookPDF=_bookPDF;

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



#pragma mark - overwrite bookCover and bookPDF inicializers
-(UIImage *) bookCover
{
    if (_bookCover==nil)
    {
        if(![self isFileDownload:self.bookCoverURL])
        {
            // crear un cola
            dispatch_queue_t loadCovers = dispatch_queue_create("loadCovers", 0);
            
            
            dispatch_async(loadCovers, ^{
                
                [self downloadPicture:self.bookCoverURL withFileName:[self discoverFileName:self.bookCoverURL]];
                
                NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:self.bookCoverURL]];
                
                
                // se ejecuta en primer plano
                dispatch_async(dispatch_get_main_queue(), ^{
                    _bookCover=[UIImage imageWithData:data];
                    
                });
            });
            
            
        }
        else
        {
            NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:self.bookCoverURL]];
            _bookCover=[UIImage imageWithData:data];
        }
    }
    return _bookCover;
}
-(NSData *) bookPDF
{
    if (_bookPDF==nil)
    {
        if(![self isFileDownload:self.bookCoverURL])
        {
            // crear un cola
            dispatch_queue_t loadPDFs = dispatch_queue_create("loadPDFs", 0);
            
            
            dispatch_async(loadPDFs, ^{
                
                [self downloadPicture:self.bookPDFURL withFileName:[self discoverFileName:self.bookPDFURL]];
                
                _bookPDF = [NSData dataWithContentsOfFile:[self discoverFileName:self.bookCoverURL]];
                
            });
            
            
        }
        else
        {
            NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:self.bookCoverURL]];
            _bookCover=[UIImage imageWithData:data];
        }
    }
    return _bookPDF;
}
- (NSString *) discoverFileName: (NSURL *) aURL
{
    //vemos cual es la ruta fisica del directorio de cache
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory=[paths objectAtIndex: 0];
    
    //sacamos el nombre teorico que tendria el fichero si estuviera grabado.
    
    NSString *nombreFichero = [aURL absoluteString];
    
    nombreFichero = [[[nombreFichero stringByReplacingOccurrencesOfString:@"/"withString:@"_"]stringByReplacingOccurrencesOfString:@":" withString:@"_"]stringByReplacingOccurrencesOfString:@"www." withString:@"www_"];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/%@",cachesDirectory,nombreFichero];
    
    return fileName;
}

-(BOOL) isFileDownload: (NSURL *) aURL
{
    NSString *fileName = [self discoverFileName:aURL];
    //comprobamos si existe esa ruta
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    if ([fm fileExistsAtPath: fileName])
    {
        
        return true;
    }
    
    return false;
}

- (void) downloadPicture: (NSURL *) aURL withFileName: (NSString *) aFileName
{
    //grabamos la imagen
    NSData *data = [NSData dataWithContentsOfURL:aURL];
    [data writeToFile:aFileName atomically:TRUE];
}

@end