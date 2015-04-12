#import "IAATags.h"

@interface IAATags ()

// Private interface goes here.

@end

@implementation IAATags

// Custom logic goes here.

+(instancetype) tagWithName: (NSString *)name book: (IAABook *) book context: (NSManagedObjectContext *) context;
{
    IAATags *t=[self insertInManagedObjectContext:context];
    t.tag = name;
    return t;
}

@end
