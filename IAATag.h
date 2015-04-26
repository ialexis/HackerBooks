#import "_IAATag.h"

@interface IAATag : _IAATag {}
+(instancetype) tagWithName: (NSString *)name context: (NSManagedObjectContext *) context;

-(NSArray*) booksWithTag;
-(NSInteger) booksCount;
@end
