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
    if (self.manager != nil) {
        if (![self.manager kitchen:self
             shouldMakePizzaOfSize:size
                       andToppings:toppings]) {
            return nil;
        }
        if ([self.manager kitchenShouldUpgradeOrder:self]) {
            size = Large;
        }
    }
    Pizza *pizza = [[Pizza alloc]initWithPizzaSize:size toppings:toppings];
    if ([self.manager respondsToSelector:@selector(kitchenDidMakePizza:)]) {
        [self.manager kitchenDidMakePizza:pizza];
    }
    return pizza;
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
