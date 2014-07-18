//
//  PersonDataSource.m
//
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import "PersonDataSource.h"
#import "PersonDataObject.h"
#import "NSArray+Util.h"

@implementation PersonDataSource

static NSArray* surnames;
static NSArray* forenames;

+ (NSArray *)generatePeople:(NSUInteger)peopleCount
{
    [self initStaticArrays];
    
    NSMutableArray* people = [[NSMutableArray alloc] init];
    for (int i=0; i<peopleCount; i++)
    {
        [people addObject:[PersonDataObject personWithSurname:[surnames randomElement]
                                                     forename:[forenames randomElement]
                                                        age:[NSNumber numberWithInt: arc4random() % 30 + 10]]];
    }
    return people;
}

+ (void)initStaticArrays
{
    if (forenames == nil) {
        forenames = @[@"Brian", @"Fred", @"Carol", @"Philip", @"Ian", @"James", @"Archie", @"Marlon",
                    @"Josh", @"Sacha", @"Laurent", @"Robert", @"Sarra", @"Jessica", @"Lauren",
                    @"Mike", @"John", @"Josh", @"Peter", @"Lucy", @"Anna", @"Hannah", @"Lilly",
                    @"Digby", @"Elizabeth", @"Jonathan", @"Andrew", @"Alexander", @"Christopher",
                    @"Nicholas", @"Addison", @"Madison", @"Samantha", @"Abigail", @"Mia", @"Ava",
                    @"Taylor"];
    }
    
    if (surnames == nil ) {
        surnames = @[@"Smith", @"Blessed", @"Barber", @"Jones", @"Newsome", @"Price", @"Page", @"Pounder",
                @"Scott", @"Martin", @"Wildsmith", @"Wilder", @"King", @"Ferguson", @"Batchelor", @"Peter",
                @"Elliot", @"Fritz", @"Gregg", @"Harper", @"Karl", @"Lees", @"Ousbourne", @"Quincey", @"Rogers",
                @"Rea", @"Richards", @"Digby", @"Daniels", @"Phillips", @"Eberhardt", @"Taylor",
                @"Brown", @"Johnson", @"Walker", @"Hill", @"Moore", @"Baker", @"Patel", @"Morgan"];
    }
}

@end
