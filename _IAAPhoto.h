// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAAPhoto.h instead.

@import CoreData;

extern const struct IAAPhotoAttributes {
	__unsafe_unretained NSString *photo;
} IAAPhotoAttributes;

extern const struct IAAPhotoRelationships {
	__unsafe_unretained NSString *annotation;
} IAAPhotoRelationships;

@class IAAAnnotation;

@interface IAAPhotoID : NSManagedObjectID {}
@end

@interface _IAAPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAAPhotoID* objectID;

@property (nonatomic, strong) NSData* photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAAAnnotation *annotation;

//- (BOOL)validateAnnotation:(id*)value_ error:(NSError**)error_;

@end

@interface _IAAPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhoto;
- (void)setPrimitivePhoto:(NSData*)value;

- (IAAAnnotation*)primitiveAnnotation;
- (void)setPrimitiveAnnotation:(IAAAnnotation*)value;

@end
