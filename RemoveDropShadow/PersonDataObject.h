//
//  PersonDataObject.h
//
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import <Foundation/Foundation.h>

// a simple data object that represents a person
@interface PersonDataObject : NSObject

@property (strong, nonatomic) NSString* surname;
@property (strong, nonatomic) NSString* forename;
@property (strong, nonatomic) NSNumber* age;

+ (PersonDataObject*) personWithSurname:(NSString*)surname forename:(NSString*)forename age:(NSNumber*)age;

@end
