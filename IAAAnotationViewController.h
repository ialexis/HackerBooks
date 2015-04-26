//
//  IAAAnotationViewController.h
//  HackerBooks
//
//  Created by Ivan on 21/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "AGTCoreDataCollectionViewController.h"
#import "IAABook.h"

@interface IAAAnotationViewController : AGTCoreDataCollectionViewController

-(id) initCoreDataCollectionViewControllerWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
  layout: (UICollectionViewFlowLayout *) layout
  book:(IAABook *) book;

@end
