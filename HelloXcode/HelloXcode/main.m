//
//  main.m
//  HelloXcode
//
//  Created by BigkongWang on 2014/8/19.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        int sum;
        sum=50+25;
        NSLog(@"Hello, World!");
        NSLog(@"The sum of 50 and 25 is %i", sum);
        NSString *myName=@"Max";
        NSLog(@"Hi! %@",myName);
        
        int age=35;
        float weight=80.5;
        NSLog(@"I am %i years old, %.2f kg.",age,weight);
        
        Fraction *myFraction=[Fraction new];
        [myFraction setNumerator:1];
        [myFraction setDenominator:3];
        [myFraction print];
        NSLog(@"numerator is:%i\n denominator is: %i",[myFraction numerator],[myFraction denominator]);
        
        
        
    }
    return 0;
}

