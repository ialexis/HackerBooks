// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAATag.m instead.

#import "_IAATag.h"

const struct IAATagAttributes IAATagAttributes = {
	.priority = @"priority",
	.tag = @"tag",
};

const struct IAATagRelationships IAATagRelationships = {
	.books = @"books",
};

@implementation IAATagID
@end

@implementation _IAATag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (IAATagID*)objectID {
	return (IAATagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"priorityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"priority"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic priority;

- (BOOL)priorityValue {
	NSNumber *result = [self priority];
	return [result boolValue];
}

- (void)setPriorityValue:(BOOL)value_ {
	[self setPriority:@(value_)];
}

- (BOOL)primitivePriorityValue {
	NSNumber *result = [self primitivePriority];
	return [result boolValue];
}

- (void)setPrimitivePriorityValue:(BOOL)value_ {
	[self setPrimitivePriority:@(value_)];
}

@dynamic tag;

@dynamic books;

- (NSMutableSet*)booksSet {
	[self willAccessValueForKey:@"books"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"books"];

	[self didAccessValueForKey:@"books"];
	return result;
}

@end

