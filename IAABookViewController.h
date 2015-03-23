//
//  IAABookViewController.h
//  HackerBooks
//
//  Created by Ivan on 22/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAABook.h"

@interface IAABookViewController : UIViewController

@property (strong, nonatomic) IAABook *book;
@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookTagsLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (strong,nonatomic) NSData *PDF;


-(id) initWithBook: (IAABook *) aBook;

- (IBAction)setFavorite:(id)sender;
@end
