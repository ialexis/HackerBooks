#import "_IAATag.h"

@interface IAATag : _IAATag {}
+(instancetype) tagWithName: (NSString *)name book: (IAABook *) book context: (NSManagedObjectContext *) context;


@end
