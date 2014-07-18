//
//  PersonDataObject.m
//
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import "PersonDataObject.h"

@implementation PersonDataObject

+ (PersonDataObject *)personWithSurname:(NSString *)surname forename:(NSString *)forename age:(NSNumber *)age
{
    PersonDataObject* obj = [[PersonDataObject alloc] init];
    obj.age = age;
    obj.forename = forename;
    obj.surname = surname;
    return obj;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@ - %@", _surname, _forename, _age];
}


@end
