#import "IAAPhoto.h"

@interface IAAPhoto ()

// Private interface goes here.

@end

@implementation IAAPhoto




#pragma mark - Properties

-(void) setImage:(UIImage *)image{
    
    // sincronizar con imageData
    self.photo = UIImagePNGRepresentation(image);
    
}

-(UIImage *) image{
    
    if (self.photo==nil)
    {
        
        
        // Load url image into NSData
        return [UIImage imageNamed:@"noimages.png"];
    }
    

    
    return [UIImage imageWithData:self.photo];
    
}


#pragma mark - Class Methods
+(instancetype) photoWithImage:(UIImage *) image
                       context:(NSManagedObjectContext *) context{
    
    IAAPhoto *p = [NSEntityDescription insertNewObjectForEntityForName:[IAAPhoto entityName]
                                                inManagedObjectContext:context];
    
    p.photo = UIImageJPEGRepresentation(image, 0.9);
    
    
    return p;
    
}







@end
