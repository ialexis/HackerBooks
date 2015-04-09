// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAABook.m instead.

#import "_IAABook.h"

const struct IAABookAttributes IAABookAttributes = {
	.authors = @"authors",
	.coverURL = @"coverURL",
	.pdfURL = @"pdfURL",
	.tags = @"tags",
	.title = @"title",
};

const struct IAABookRelationships IAABookRelationships = {
	.pdf = @"pdf",
};

@implementation IAABookID
@end

@implementation _IAABook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Book";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Book" inManagedObjectContext:moc_];
}

- (IAABookID*)objectID {
	return (IAABookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic authors;

@dynamic coverURL;

@dynamic pdfURL;

@dynamic tags;

@dynamic title;

@dynamic pdf;

@end

