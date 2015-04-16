//
//  IAALibraryTableViewController.h
//  HackerBooks
//
//  Created by Ivan on 12/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"

@class IAALibraryTableViewController;
@class IAABook;

@protocol IAALibraryTableViewControllerDelegate <NSObject>

-(void) IAALibraryTableViewController: (IAALibraryTableViewController *) aLibraryVC
                        didSelectBook:(IAABook *) aBook;

@end
@interface IAALibraryTableViewController : AGTCoreDataTableViewController <IAALibraryTableViewControllerDelegate>

@property (weak, nonatomic) id<IAALibraryTableViewControllerDelegate> delegate;
- (IAABook *)lastSelectedBookWithContext:(NSManagedObjectContext *) context;
@end
