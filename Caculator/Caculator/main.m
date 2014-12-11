//
//  main.m
//  Caculator
//
//  Created by BigkongWang on 2014/8/19.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Caculator:NSObject
{
        double accumulator;
}
-(void)setResult:(double) value;
-(void)clearResult;
-(double)result;
-(void)add:(double) value;
-(void)subtract:(double) value;
-(void)multiply:(double) value;
-(void)divide:(double) value;
@end

@implementation Caculator
-(void)setResult:(double) value
{
    accumulator=value;
}
-(void)clearResult
{
    accumulator=0;
}
-(double)result
{
    return accumulator;
}
-(void)add:(double) value
{
    accumulator+= value;
}
-(void)subtract:(double) value
{
    accumulator-= value;

}
-(void)multiply:(double) value
{
    accumulator*= value;

}
-(void)divide:(double) value
{
    accumulator/= value;

}
@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, my caculator!");
        Caculator *myCaculator= [[Caculator alloc]init];
        [myCaculator clearResult];
        [myCaculator add:5];
        NSLog(@"Result:%g",[myCaculator  result]);
        
    }
    return 0;
}

