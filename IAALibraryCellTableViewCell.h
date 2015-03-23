//
//  IAALibraryCellTableViewCell.h
//  HackerBooks
//
//  Created by Ivan on 21/3/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAALibraryCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImage;
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthors;
@property (weak, nonatomic) IBOutlet UIImageView *bookFavoriteImage;

@end
