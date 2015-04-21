#import "_IAAPhoto.h"
#import <UIKit/UIKit.h>

@interface IAAPhoto : _IAAPhoto {}

@property(nonatomic, strong) UIImage *image;


+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context;
@end
