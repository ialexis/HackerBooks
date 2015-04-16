#import "IAABook.h"
#import "IAAPDF.h"
#import "IAATag.h"

@interface IAABook ()

// Private interface goes here.



@end

@implementation IAABook

// Custom logic goes here.








#pragma mark - class methods
+(instancetype) bookWithTitle: (NSString *)title context:(NSManagedObjectContext *) context
{
    IAABook *book = [self insertInManagedObjectContext:context];
    book.title = title;
    
    return book;
}

+(instancetype) bookWithDictionary: (NSDictionary *)aDict context:(NSManagedObjectContext *) context
{
     IAABook *book = [self insertInManagedObjectContext:context];
    
    book.title=[aDict objectForKey:@"title"];
    book.authors=[aDict objectForKey:@"authors"];
    //NSArray *tags= [NSSet setWithArray:[[aDict objectForKey:@"tags"]componentsSeparatedByString:@", "]];
    
    NSArray *tags= [[aDict objectForKey:@"tags"]componentsSeparatedByString:@", "];
    
   // NSMutableArray *allTags=[NSMutableArray new];
    
    [tags enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"tag %lu:%@",(unsigned long)idx,obj);
        
      IAATag *tag = [IAATag tagWithName:obj book:book context:book.managedObjectContext];
        
       // [allTags addObject:tag];
      [book addTagsObject:tag];
    }];
    //book.tags = [NSSet setWithArray:allTags];
    //[book addTagsObject:tag];
    book.coverURL=[aDict objectForKey:@"image_url"];
    book.pdfURL=[aDict objectForKey:@"pdf_url"];
    book.pdf=[IAAPDF insertInManagedObjectContext:context];
    
 
    return book;
}

-(UIImage *) imageBookCover{
    
    
    if (self.coverImage==nil)
    {

        
        // Load url image into NSData
        NSError *error;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.coverURL]
                                             options:kNilOptions
                                               error:&error];
        if(data==nil)
        {
            // Error when loading pdf
            NSLog(@"Error %@ when loading data within the browser",error.localizedDescription);
        }
        self.coverImage=data;
    }

    
    // Convertir la NSData en UIImage
    return [UIImage imageWithData:self.coverImage];
}


#pragma mark - utils

+(NSArray *) extractAuthorsFromJSONString:(NSString *) JSONAuthorsString
{
    NSArray *authors = [JSONAuthorsString componentsSeparatedByString:@", "];
    
    return authors;
}
+(NSArray *) extractTagsFromJSONString:(NSString *) JSONTagsString
{
    NSArray *tags= [JSONTagsString componentsSeparatedByString:@", "];
    return tags;
}

-(NSString *) tagsDescription{
    
   
    NSArray *array = [self.tags allObjects];
    NSMutableArray *arrayTags = [NSMutableArray new];
    
    for (int i=0; i<[array count]; i++)
    {
        IAATag *t =[array objectAtIndex:i];
        [arrayTags addObject: t.tag];
    }
    
    return [arrayTags componentsJoinedByString:@", "];
    
}

// Returns an NSData with the serialized URI representation of the
// objectID. Ready to save it in a NSUserDefaults, for example.
-(NSData*) archiveURIRepresentation{
    
    NSURL *uri = self.objectID.URIRepresentation;
    return [NSKeyedArchiver archivedDataWithRootObject:uri];
}

- (IAATag *) getTagByName: (NSString *) tagName context:(NSManagedObjectContext *) context
{
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[IAATag entityName]];
    [req setPredicate:[NSPredicate predicateWithFormat:@"tag == %@", tagName]];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:req error:&error];
    
    IAATag *tagADevolver=nil;
    for (IAATag *t in fetchedObjects)
    {
        tagADevolver = t;
    }
    return tagADevolver;
}

- (BOOL) isFavoriteWithcontext:(NSManagedObjectContext *) context
{
    //creamos el tag favoritos
   
    if ([self getTagByName:@"Favoritos" context:context])
    {
        return true;
    }
    return false;
}

- (void) setFavorite: (BOOL) value;
{
   //  IAATag *tagFavorito =
    
    
    if (value)
    {
       // [self addTagsObject:tagFavorito];
        [self addTagsObject:[IAATag tagWithName:@"Favoritos" book:self context:self.managedObjectContext]];
    }
    else
    {
        for (IAATag *tagToDelete in self.tags)
        {
            if ([tagToDelete.tag isEqualToString:@"Favoritos"])
            {
                [self.managedObjectContext deleteObject:tagToDelete];
            }
        }
       // [self removeTagsObject:[self.managedObjectContext objectWithID:theEmployee.objectID]]];
    }
    [self setIsFavoriteValue:value];
}
@end
