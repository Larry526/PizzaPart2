//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"

int main(int argc, const char * argv[])
{
    
    NSLog(@"Please pick your pizza size and toppings:");
    
    Kitchen *kitchen = [Kitchen new];
    
    while (YES) {
        // Loop forever
        
        NSLog(@"> ");
        char str[100];
        fgets (str, 100, stdin);
        
        NSString *inputString = [[NSString alloc] initWithUTF8String:str];
        inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSLog(@"Input was %@", inputString);
        
        // Take the first word of the command as the size, and the rest as the toppings
        NSArray <NSString *>*commandWords = [inputString componentsSeparatedByString:@" "];
        
        if ([commandWords.firstObject.lowercaseString isEqualToString:@"popperoni"]) {
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
        NSString *sizeStr = [kitchen sizeStringFromPizzaSize:pizza.size];
        NSString *toppingStr = [toppings componentsJoinedByString:@" "];
        NSLog(@"You order a pizza of size %@, with toppings: %@", sizeStr, toppingStr);
        
    }
    
    return 0;
}

