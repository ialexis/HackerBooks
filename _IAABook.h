// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAABook.h instead.

@import CoreData;

extern const struct IAABookAttributes {
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *coverURL;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *tags;
	__unsafe_unretained NSString *title;
} IAABookAttributes;

extern const struct IAABookRelationships {
	__unsafe_unretained NSString *pdf;
} IAABookRelationships;

@class IAAPDF;

@interface IAABookID : NSManagedObjectID {}
@end

@interface _IAABook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAABookID* objectID;

@property (nonatomic, strong) NSString* authors;

//- (BOOL)validateAuthors:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* coverURL;

//- (BOOL)validateCoverURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* tags;

//- (BOOL)validateTags:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAAPDF *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@end

@interface _IAABook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSString*)value;

- (NSString*)primitiveCoverURL;
- (void)setPrimitiveCoverURL:(NSString*)value;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitiveTags;
- (void)setPrimitiveTags:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (IAAPDF*)primitivePdf;
- (void)setPrimitivePdf:(IAAPDF*)value;

@end
