//
//  IAASimpleAnnotationViewController.h
//  HackerBooks
//
//  Created by Ivan on 26/04/15.
//  Copyright (c) 2015 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IAAAnnotation.h"

@interface IAASimpleAnnotationViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *creationDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *modificationDateLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameView;
@property (weak, nonatomic) IBOutlet UITextView *annotationText;
@property (nonatomic, strong) IAAAnnotation *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

-(id) initWithModel:(IAAAnnotation *) model;

- (IBAction)displayPhoto:(id)sender;
@end
