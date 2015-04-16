#import "_IAABook.h"
#import <UIKit/UIKit.h>


@interface IAABook : _IAABook {}
// Custom logic goes here.

@property (nonatomic, strong) UIImage *imageBookCover;


+(instancetype) bookWithTitle: (NSString *)title context:(NSManagedObjectContext *) context;
+(instancetype) bookWithDictionary: (NSDictionary *)aDict context:(NSManagedObjectContext *) context;

-(NSString *) tagsDescription;
-(BOOL) isFavoriteWithcontext:(NSManagedObjectContext *) context;
-(void) setFavorite: (BOOL) value;
-(NSData*) archiveURIRepresentation;

@end
