// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAATags.h instead.

@import CoreData;

extern const struct IAATagsAttributes {
	__unsafe_unretained NSString *tag;
} IAATagsAttributes;

extern const struct IAATagsRelationships {
	__unsafe_unretained NSString *books;
} IAATagsRelationships;

@class IAABook;

@interface IAATagsID : NSManagedObjectID {}
@end

@interface _IAATags : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAATagsID* objectID;

@property (nonatomic, strong) NSString* tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _IAATags (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(IAABook*)value_;
- (void)removeBooksObject:(IAABook*)value_;

@end

@interface _IAATags (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveTag;
- (void)setPrimitiveTag:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
