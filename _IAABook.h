// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAABook.h instead.

@import CoreData;

extern const struct IAABookAttributes {
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *coverImage;
	__unsafe_unretained NSString *coverURL;
	__unsafe_unretained NSString *isFavorite;
	__unsafe_unretained NSString *pdfURL;
	__unsafe_unretained NSString *title;
} IAABookAttributes;

extern const struct IAABookRelationships {
	__unsafe_unretained NSString *pdf;
	__unsafe_unretained NSString *tags;
} IAABookRelationships;

@class IAAPDF;
@class IAATag;

@interface IAABookID : NSManagedObjectID {}
@end

@interface _IAABook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAABookID* objectID;

@property (nonatomic, strong) NSString* authors;

//- (BOOL)validateAuthors:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* coverImage;

//- (BOOL)validateCoverImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* coverURL;

//- (BOOL)validateCoverURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* isFavorite;

@property (atomic) BOOL isFavoriteValue;
- (BOOL)isFavoriteValue;
- (void)setIsFavoriteValue:(BOOL)value_;

//- (BOOL)validateIsFavorite:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* pdfURL;

//- (BOOL)validatePdfURL:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) IAAPDF *pdf;

//- (BOOL)validatePdf:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _IAABook (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(IAATag*)value_;
- (void)removeTagsObject:(IAATag*)value_;

@end

@interface _IAABook (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSString*)value;

- (NSData*)primitiveCoverImage;
- (void)setPrimitiveCoverImage:(NSData*)value;

- (NSString*)primitiveCoverURL;
- (void)setPrimitiveCoverURL:(NSString*)value;

- (NSNumber*)primitiveIsFavorite;
- (void)setPrimitiveIsFavorite:(NSNumber*)value;

- (BOOL)primitiveIsFavoriteValue;
- (void)setPrimitiveIsFavoriteValue:(BOOL)value_;

- (NSString*)primitivePdfURL;
- (void)setPrimitivePdfURL:(NSString*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (IAAPDF*)primitivePdf;
- (void)setPrimitivePdf:(IAAPDF*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
