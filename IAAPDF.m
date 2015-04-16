#import "IAAPDF.h"
#import "IAABook.h"

@interface IAAPDF ()

// Private interface goes here.

@end

@implementation IAAPDF

@synthesize pdf;

- (NSData *)pdf
{
    if (self.pdfData==nil)
    {
        /*
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
         */
        
        
        // Load url image into NSData
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.book.pdfURL]
                                             options:kNilOptions
                                               error:&error];
        if(data==nil)
        {
            // Error when loading pdf
            NSLog(@"Error %@ when loading data within the browser",error.localizedDescription);
        }
        self.pdfData=data;
    }
    
    
    // Convertir la NSData en UIImage
    return self.pdfData;

}

@end
