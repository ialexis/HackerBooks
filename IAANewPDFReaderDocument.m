//
//  IAANewPDFReaderDocument.m
//  HackerBooks
//
//  Created by Ivan on 31/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "IAANewPDFReaderDocument.h"
#import "IAABook.h"

@implementation IAANewPDFReaderDocument

#pragma mark - ReaderDocument instance methods


- (NSString *)fileName
{
    [super fileName];
    
    
    return self.book.title;
}


#pragma mark - init
-(id) initWithBook: (IAABook *) book
{
    
    
    [book bookPDFDownload];
    
    if (self == [super initWithFilePath:book.bookPDFFileName password:nil])
    {
        
        _book=book;
        
    }
    return self;
    
}




@end
