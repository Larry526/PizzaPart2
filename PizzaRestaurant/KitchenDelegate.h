//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by James Cash on 03-11-17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#ifndef KitchenDelegate_h
#define KitchenDelegate_h

#include "Pizza.h"

@class Kitchen;

@protocol KitchenDelegate <NSObject>

- (BOOL)kitchen:(Kitchen *)kitchen
shouldMakePizzaOfSize:(PizzaSize)size
    andToppings:(NSArray *)toppings;

-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

@optional

- (void)kitchenDidMakePizza:(Pizza *)pizza;


@end

#endif /* KitchenDelegate_h */
