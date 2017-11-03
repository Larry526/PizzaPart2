//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnchovieHaterManager.h"
#import "HappyManager.h"
#import "Kitchen.h"

int main(int argc, const char * argv[])
{
    
    NSLog(@"Please pick your pizza size and toppings:");
    
    Kitchen *kitchen = [Kitchen new];

    AnchovieHaterManager *anchovieHater;
    HappyManager *happyManager;

    while (YES) {
        // Loop forever

        NSLog(@"Manager? (a/h/n)> ");
        char str[100];
        fgets (str, 100, stdin);

        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

        if ([inputString isEqualToString:@"a"]) {
            if (!anchovieHater) {
                anchovieHater = [[AnchovieHaterManager alloc] init];
            }
            kitchen.manager = anchovieHater;
        } else if ([inputString isEqualToString:@"h"]) {
            if (!happyManager) {
                happyManager = [[HappyManager alloc] init];
            }
            kitchen.manager = happyManager;
        } else {
            kitchen.manager = nil;
        }

        
        NSLog(@"> ");
        fgets (str, 100, stdin);
        
        inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSLog(@"Input was %@", inputString);
        
        // Take the first word of the command as the size, and the rest as the toppings
        NSArray <NSString *>*commandWords = [inputString componentsSeparatedByString:@" "];
        
        if ([commandWords.firstObject.lowercaseString isEqualToString:@"pepperoni"]) {
            Pizza *largePepperoni = [Kitchen largePepperoni];
            // log out
            continue;
        }
        
        // And then send some message to the kitchen...
        NSString *sizeString = commandWords.firstObject;
        
        PizzaSize size = [kitchen pizzaSizeFromString:sizeString];
        NSRange range = NSMakeRange(1, commandWords.count-1);
        NSArray <NSString *>*toppings = [commandWords subarrayWithRange:range];
        Pizza *pizza = [kitchen makePizzaWithSize:size toppings:toppings];
        if (pizza) {
            NSString *sizeStr = [kitchen sizeStringFromPizzaSize:pizza.size];
            NSString *toppingStr = [pizza.toppings componentsJoinedByString:@" "];
            NSLog(@"You order a pizza of size %@, with toppings: %@", sizeStr, toppingStr);
        } else {
            NSLog(@"No pizza for you");
        }
        
    }
    
    return 0;
}

