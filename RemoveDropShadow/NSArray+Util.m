//
//  NSArray+Util.m
//
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import "NSArray+Util.h"

@implementation NSArray (Util)

- (id)randomElement
{
    return self[arc4random() % self.count];
}

@end
