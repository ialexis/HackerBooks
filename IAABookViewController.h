//
//  IAABookViewController.h
//  HackerBooks
//
//  Created by Ivan on 22/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAABook.h"
#import "IAALibraryTableViewController.h"

@interface IAABookViewController : UIViewController <UISplitViewControllerDelegate,IAALibraryTableViewControllerDelegate >



@property (strong, nonatomic) IAABook *book;

//properties portraid
@property (strong, nonatomic) IBOutlet UIView *portraidView;
@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookTagsLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (strong,nonatomic) NSData *PDF;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarButtonMarkAsFavorite;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarButtomReadBook;


//properties Landscape
@property (strong, nonatomic) IBOutlet UIView *LandscapeView;
@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImageLandscape;
@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabelLandscape;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorsLabelLanscape;
@property (weak, nonatomic) IBOutlet UILabel *bookTagsLabelLandscape;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarButtonMarkAsFavoriteLandscape;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *toolbarButtomReadBookLandscape;


-(id) initWithBook: (IAABook *) aBook;

- (IBAction)showPDF:(id)sender;

- (IBAction)setFavorite:(id)sender;
@end
