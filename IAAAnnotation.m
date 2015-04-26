#import "IAAAnnotation.h"
#import "IAAPhoto.h"

@interface IAAAnnotation ()

// Private interface goes here.

@end

@implementation IAAAnnotation


-(UIImage *)imageAnnotation{
    
    
    if (self.photo==nil)
    {
       
        
        // Load url image into NSData
        return [UIImage imageNamed:@"noimages.png"];
    }
    
    IAAPhoto *foto = self.photo;
    return foto.image;
}

#pragma mark - Class Methods
+(NSArray *) observableKeys{
    return @[IAAAnnotationAttributes.text, IAAAnnotationRelationships.photo];
}

+(instancetype) annotationWithText:(NSString *) text
                              book:(IAABook*) book
                           context:(NSManagedObjectContext *) context
{

    IAAAnnotation *annotation = [self insertInManagedObjectContext:context];
    annotation.book= book;
    annotation.text = text;
    annotation.creationDate = [NSDate date];
    annotation.modificationDate = [NSDate date];
    annotation.photo = [IAAPhoto photoWithImage:nil context:annotation.managedObjectContext];

    
    

    
    return annotation;
}


#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    self.modificationDate = [NSDate date];
}


@end
