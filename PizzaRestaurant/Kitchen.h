//
//  Kitchen.h
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "KitchenDelegate.h"

@interface Kitchen : NSObject

@property (nonatomic,strong) id<KitchenDelegate> manager;

- (PizzaSize)pizzaSizeFromString:(NSString *)sizeString;
- (NSString *)sizeStringFromPizzaSize:(PizzaSize)size;

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings;
+ (Pizza *)largePepperoni;
@end
