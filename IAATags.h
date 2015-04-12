#import "_IAATags.h"

@interface IAATags : _IAATags {}
// Custom logic goes here.



+(instancetype) tagWithName: (NSString *)name book: (IAABook *) book context: (NSManagedObjectContext *) context;
                                                     
                                                     
@end

