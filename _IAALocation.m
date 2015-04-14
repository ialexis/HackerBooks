// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to IAALocation.m instead.

#import "_IAALocation.h"

const struct IAALocationAttributes IAALocationAttributes = {
	.address = @"address",
	.latitude = @"latitude",
	.longitude = @"longitude",
};

const struct IAALocationRelationships IAALocationRelationships = {
	.annotation = @"annotation",
};

@implementation IAALocationID
@end

@implementation _IAALocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Location";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Location" inManagedObjectContext:moc_];
}

- (IAALocationID*)objectID {
	return (IAALocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic address;

@dynamic latitude;

@dynamic longitude;

@dynamic annotation;

@end

