//
//  MyData.h
//  HelloStoryBoard
//
//  Created by User on 2014/9/26.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyData : NSObject
@property (nonatomic,strong)NSString *testString;
+(MyData*) sharedData;
@end
