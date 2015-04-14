// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAATag.h instead.

@import CoreData;

extern const struct IAATagAttributes {
	__unsafe_unretained NSString *priority;
	__unsafe_unretained NSString *tag;
} IAATagAttributes;

extern const struct IAATagRelationships {
	__unsafe_unretained NSString *books;
} IAATagRelationships;

@class IAABook;

@interface IAATagID : NSManagedObjectID {}
@end

@interface _IAATag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) IAATagID* objectID;

@property (nonatomic, strong) NSDecimalNumber* priority;

//- (BOOL)validatePriority:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* tag;

//- (BOOL)validateTag:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *books;

- (NSMutableSet*)booksSet;

@end

@interface _IAATag (BooksCoreDataGeneratedAccessors)
- (void)addBooks:(NSSet*)value_;
- (void)removeBooks:(NSSet*)value_;
- (void)addBooksObject:(IAABook*)value_;
- (void)removeBooksObject:(IAABook*)value_;

@end

@interface _IAATag (CoreDataGeneratedPrimitiveAccessors)

- (NSDecimalNumber*)primitivePriority;
- (void)setPrimitivePriority:(NSDecimalNumber*)value;

- (NSString*)primitiveTag;
- (void)setPrimitiveTag:(NSString*)value;

- (NSMutableSet*)primitiveBooks;
- (void)setPrimitiveBooks:(NSMutableSet*)value;

@end
