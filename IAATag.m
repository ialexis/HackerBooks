#import "IAATag.h"

@interface IAATag ()

// Private interface goes here.

@end

@implementation IAATag

+(instancetype) tagWithName: (NSString *)name context: (NSManagedObjectContext *) context;
{
    
    
    
    IAATag *t = [IAATag tagNamed:name context:context];
    
    if (!t) {
        
        t = [IAATag insertInManagedObjectContext:context];
        
        t.tag = name;
    }
    
    return t;

    
    
    /*
    
    [t setPriorityValue:NO];
    if ([name isEqualToString:@"Favoritos"])
    {
       [t setPriorityValue:YES];
    }
    
    return t;*/
}


+(IAATag*) tagNamed:(NSString*) name context:(NSManagedObjectContext*) context{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[IAATag entityName]];
    
    req.predicate = [NSPredicate predicateWithFormat:@"tag = %@", [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]];
    
    NSError *error;
    
    IAATag *tag = [[context executeFetchRequest:req
                                          error:&error] lastObject];
    
    
    return tag;
    
}

// Compare personalizado para mostrar el tag Favorite como primero.

-(NSComparisonResult) compare:(IAATag*) other{
    
    static NSString* favorito = @"Favoritos";
    
    if ([self.tag isEqualToString:other.tag]) {
        return NSOrderedSame;
        
    }else if ([self.tag isEqualToString:favorito]){
        return NSOrderedAscending;
        
    }else if ([other.tag isEqualToString:favorito]){
        return NSOrderedDescending;
        
    }else{
        return [self.tag compare:other.tag];
    }
}

#pragma mark - utils
-(NSArray*) booksWithTag{
    
    NSArray *books = [self.books allObjects];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    
    books = [books sortedArrayUsingDescriptors:@[sort]];
    
    return books;
    
}

-(NSInteger) booksCount{
    
    return [[self.books allObjects] count];
}

@end
