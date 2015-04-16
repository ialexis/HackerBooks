// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAAPhoto.m instead.

#import "_IAAPhoto.h"

const struct IAAPhotoAttributes IAAPhotoAttributes = {
	.photo = @"photo",
};

const struct IAAPhotoRelationships IAAPhotoRelationships = {
	.annotation = @"annotation",
};

@implementation IAAPhotoID
@end

@implementation _IAAPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (IAAPhotoID*)objectID {
	return (IAAPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photo;

@dynamic annotation;

@end

