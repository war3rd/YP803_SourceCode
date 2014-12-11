//
//  main.m
//  HelloCategory
//
//  Created by BigkongWang on 2014/8/19.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString(CheckEmpty)
-(BOOL)isEmpty;
@end
@implementation NSString(CheckEmpty)
-(BOOL)isEmpty
{
    return self.length==0?YES:NO;
}
@end
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSString *myNSString=@"Hello!";
        NSString *myNSString2=@"";
        if([myNSString isEmpty]){
            NSLog(@"myNSString is empty!");
        }
        if([myNSString2 isEmpty]){
            NSLog(@"myNSString2 is empty!");
        }
        NSLog(@"Hello, World!");
        
    }
    return 0;
}

