#import "IAABook.h"

@interface IAABook ()

// Private interface goes here.



@end

@implementation IAABook

// Custom logic goes here.








#pragma mark - class methods
+(instancetype) bookWithTitle: (NSString *)title context:(NSManagedObjectContext *) context
{
    IAABook *book = [self insertInManagedObjectContext:context];
    book.title = title;
    
    return book;
}

+(instancetype) bookWithDictionary: (NSDictionary *)aDict context:(NSManagedObjectContext *) context
{
     IAABook *book = [self insertInManagedObjectContext:context];
    
    book.title=[aDict objectForKey:@"title"];
   // book.authors=[self extractAuthorsFromJSONString:[aDict objectForKey:@"authors"]];
  //  book.tags=[[aDict objectForKey:@"tags"]componentsSeparatedByString:@", "];
    book.coverURL=[aDict objectForKey:@"image_url"];
    book.pdfURL=[aDict objectForKey:@"pdf_url"];

    return book;
}

//-(UIImage *) image{
    
    // Convertir la NSData en UIImage
//    return [UIImage imageWithData:self.coverImage];
//}


-(NSData *) coverImage
{
    if (self.coverImage==nil)
    {
        if(![self isFileDownload:[NSURL URLWithString:self.coverURL]])
        {
            
            
            // crear un cola
             dispatch_queue_t loadCovers = dispatch_queue_create("loadCovers", 0);
             
             
             dispatch_async(loadCovers, ^{
             
             [self downloadFile:[NSURL URLWithString:self.coverURL] withFileName:[self discoverFileName:[NSURL URLWithString:self.coverURL]]];
             
             NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:[NSURL URLWithString:self.coverURL]]];
             
             
             // se ejecuta en primer plano
             dispatch_async(dispatch_get_main_queue(), ^{
             self.coverImage=data;
             
             });
             });
            
            /*
            [self downloadFile:self.bookCoverURL withFileName:[self discoverFileName:self.bookCoverURL]];
            
            NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:self.bookCoverURL]];
            _bookCover=data;
            
            */
        }
        else
        {
            NSData *data = [NSData dataWithContentsOfFile:[self discoverFileName:[NSURL URLWithString:self.coverURL]]];
            self.coverImage=data;
        }
    }
    return self.coverImage;
}

#pragma mark - utils

+(NSArray *) extractAuthorsFromJSONString:(NSString *) JSONAuthorsString
{
    NSArray *authors = [JSONAuthorsString componentsSeparatedByString:@", "];
    
    return authors;
}
+(NSArray *) extractTagsFromJSONString:(NSString *) JSONTagsString
{
    NSArray *tags= [JSONTagsString componentsSeparatedByString:@", "];
    return tags;
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

- (void) downloadFile: (NSURL *) aURL withFileName: (NSString *) aFileName
{
    
    
    // Load pdf into NSData
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:aURL
                                         options:kNilOptions
                                           error:&error];
    if(data==nil){
        // Error when loading pdf
        NSLog(@"Error %@ when loading data within the browser",error.localizedDescription);
    }
    [data writeToFile:aFileName atomically:TRUE];
}
@end
