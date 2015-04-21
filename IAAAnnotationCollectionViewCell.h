//
//  IAAAnnotationCollectionViewCell.h
//  HackerBooks
//
//  Created by Ivan on 21/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAAAnnotationCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UILabel *annotationText;

@end
