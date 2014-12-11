//
//  MyData.m
//  HelloStoryBoard
//
//  Created by User on 2014/9/26.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "MyData.h"

@implementation MyData
static MyData *sharedMyDataObject=nil;
+ (MyData*) sharedData{
    if(sharedMyDataObject==nil){
        sharedMyDataObject=[[self class]new];
        
    }
    return sharedMyDataObject;
}
@end
