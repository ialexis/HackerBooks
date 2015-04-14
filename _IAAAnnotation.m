// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAAAnnotation.m instead.

#import "_IAAAnnotation.h"

const struct IAAAnnotationAttributes IAAAnnotationAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.text = @"text",
};

const struct IAAAnnotationRelationships IAAAnnotationRelationships = {
	.book = @"book",
	.location = @"location",
	.photo = @"photo",
};

@implementation IAAAnnotationID
@end

@implementation _IAAAnnotation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Annotation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Annotation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Annotation" inManagedObjectContext:moc_];
}

- (IAAAnnotationID*)objectID {
	return (IAAAnnotationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"modificationDateValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"modificationDate"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

- (BOOL)modificationDateValue {
	NSNumber *result = [self modificationDate];
	return [result boolValue];
}

- (void)setModificationDateValue:(BOOL)value_ {
	[self setModificationDate:@(value_)];
}

- (BOOL)primitiveModificationDateValue {
	NSNumber *result = [self primitiveModificationDate];
	return [result boolValue];
}

- (void)setPrimitiveModificationDateValue:(BOOL)value_ {
	[self setPrimitiveModificationDate:@(value_)];
}

@dynamic text;

@dynamic book;

@dynamic location;

@dynamic photo;

@end

