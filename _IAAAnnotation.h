// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAAAnnotation.h instead.

@import CoreData;

extern const struct IAAAnnotationAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *text;
} IAAAnnotationAttributes;

extern const struct IAAAnnotationRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *photo;
} IAAAnnotationRelationships;

@class IAABook;
@class IAALocation;
@class IAAPhoto;

@interface IAAAnnotationID : NSManagedObjectID {}
@end

@interface _IAAAnnotation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAAAnnotationID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* modificationDate;

@property (atomic) BOOL modificationDateValue;
- (BOOL)modificationDateValue;
- (void)setModificationDateValue:(BOOL)value_;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAABook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAALocation *location;

//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAAPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _IAAAnnotation (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSNumber*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSNumber*)value;

- (BOOL)primitiveModificationDateValue;
- (void)setPrimitiveModificationDateValue:(BOOL)value_;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (IAABook*)primitiveBook;
- (void)setPrimitiveBook:(IAABook*)value;

- (IAALocation*)primitiveLocation;
- (void)setPrimitiveLocation:(IAALocation*)value;

- (IAAPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(IAAPhoto*)value;

@end
