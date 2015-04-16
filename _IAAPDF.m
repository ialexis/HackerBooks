// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAAPDF.m instead.

#import "_IAAPDF.h"

const struct IAAPDFAttributes IAAPDFAttributes = {
	.pdfData = @"pdfData",
};

const struct IAAPDFRelationships IAAPDFRelationships = {
	.book = @"book",
};

@implementation IAAPDFID
@end

@implementation _IAAPDF

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PDF" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PDF";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PDF" inManagedObjectContext:moc_];
}

- (IAAPDFID*)objectID {
	return (IAAPDFID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic pdfData;

@dynamic book;

@end

