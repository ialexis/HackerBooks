#import "_IAABook.h"
#import <UIKit/UIKit.h>


@interface IAABook : _IAABook {}
// Custom logic goes here.

//@property (nonatomic, strong) UIImage *Image;


+(instancetype) bookWithTitle: (NSString *)title context:(NSManagedObjectContext *) context;
+(instancetype) bookWithDictionary: (NSDictionary *)aDict context:(NSManagedObjectContext *) context;


@end
