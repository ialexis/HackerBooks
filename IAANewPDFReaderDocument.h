//
//  IAANewPDFReaderDocument.h
//  HackerBooks
//
//  Created by Ivan on 31/03/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "Pods/Reader/Sources/ReaderDocument.h"
@class IAABook;

@interface IAANewPDFReaderDocument : ReaderDocument


@property (strong,nonatomic) IAABook *book;

-(id) initWithBook: (IAABook *) book;


@end
