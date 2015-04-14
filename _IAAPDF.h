// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAAPDF.h instead.

@import CoreData;

extern const struct IAAPDFAttributes {
	__unsafe_unretained NSString *pdfData;
} IAAPDFAttributes;

extern const struct IAAPDFRelationships {
	__unsafe_unretained NSString *book;
} IAAPDFRelationships;

@class IAABook;

@interface IAAPDFID : NSManagedObjectID {}
@end

@interface _IAAPDF : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAAPDFID* objectID;

@property (nonatomic, strong) NSData* pdfData;

//- (BOOL)validatePdfData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAABook *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;

@end

@interface _IAAPDF (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePdfData;
- (void)setPrimitivePdfData:(NSData*)value;

- (IAABook*)primitiveBook;
- (void)setPrimitiveBook:(IAABook*)value;

@end
