//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings {
    return [[Pizza alloc]initWithPizzaSize:size toppings:toppings];
}

- (PizzaSize)pizzaSizeFromString:(NSString *)sizeString {
    if ([sizeString.lowercaseString isEqualToString:@"small"]) {
        return Small;
    }
    if ([sizeString.lowercaseString isEqualToString:@"medium"]) {
        return Medium;
    }
    return Large;
}

- (NSString *)sizeStringFromPizzaSize:(PizzaSize)size {
    switch (size) {
        case Small:
            return @"small";
        case Medium:
            return @"medium";
        default:
            return @"large";
    }
}

+ (Pizza *)largePepperoni {
    return [Pizza largePepperoni];
}






@end
