//
//  IAALibraryTableViewController.h
//  HackerBooks
//
//  Created by Ivan on 21/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAALibraryModel.h"
#import "IAALibraryCellTableViewCell.h"


@class IAALibraryTableViewController;

@protocol IAALibraryTableViewControllerDelegate <NSObject>

-(void) IAALibraryTableViewController: (IAALibraryTableViewController *) aLibraryVC
                    didSelectBook:(IAABook *) aBook;

@end

@interface IAALibraryTableViewController : UITableViewController <IAALibraryTableViewControllerDelegate>

@property (strong,nonatomic) IAALibraryModel *modelLibrary;
@property (weak, nonatomic) id<IAALibraryTableViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *libraryTableView;

- (IAABook *)lastSelectedBook;

-(id) initWithLibrary: (IAALibraryModel *) aLibrary
              style: (UITableViewStyle) aStyle;
@end
