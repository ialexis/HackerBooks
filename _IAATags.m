// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAATags.m instead.

#import "_IAATags.h"

const struct IAATagsAttributes IAATagsAttributes = {
	.tag = @"tag",
};

const struct IAATagsRelationships IAATagsRelationships = {
	.books = @"books",
};

@implementation IAATagsID
@end

@implementation _IAATags

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tags" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tags";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tags" inManagedObjectContext:moc_];
}

- (IAATagsID*)objectID {
	return (IAATagsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
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

