#import "_IAAAnnotation.h"
#import <UIKit/UIKit.h>

@interface IAAAnnotation : _IAAAnnotation {}

@property (nonatomic, strong, readonly) UIImage *imageAnnotation;

+(instancetype) annotationWithText:(NSString *) text
                              book:(IAABook*) book
                           context:(NSManagedObjectContext *) context;

@end
