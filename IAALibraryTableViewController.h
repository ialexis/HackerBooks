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
#import "IAABookViewController.h"

@interface IAALibraryTableViewController : UITableViewController 

@property (strong,nonatomic) IAALibraryModel *modelLibrary;

-(id) initWithLibrary: (IAALibraryModel *) aLibrary
              style: (UITableViewStyle) aStyle;
@end
