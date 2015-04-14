#import "IAATag.h"

@interface IAATag ()

// Private interface goes here.

@end

@implementation IAATag

+(instancetype) tagWithName: (NSString *)name book: (IAABook *) book context: (NSManagedObjectContext *) context;
{
    IAATag *t=[self insertInManagedObjectContext:context];
    t.tag = name;
    
    
    
    
    
    return t;
}


@end
