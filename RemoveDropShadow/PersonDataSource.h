//
//  PersonDataSource.h
//
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import <Foundation/Foundation.h>

// a source of PeopleDataObject instances
@interface PersonDataSource : NSObject

+ (NSArray*)generatePeople:(NSUInteger)peopleCount;

@end
