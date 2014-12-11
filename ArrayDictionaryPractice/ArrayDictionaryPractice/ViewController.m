//
//  ViewController.m
//  ArrayDictionaryPractice
//
//  Created by BigkongWang on 2014/9/22.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *dict0=[NSDictionary dictionaryWithObjectsAndKeys:
                         @"BOJ A",@"KeyA",
                         @"BOJ B",@"KeyB",
                         @"BOJ C",@"KeyC",
                         @"BOJ D",@"KeyD",
                         nil];
    NSDictionary *dict1=@{@"KeyA":@"ValueA",
                          @"KeyB":@"ValueB",
                          @"KeyC":@"ValueC",
                          @"KeyD":@"ValueD",
                          };
    NSDictionary *dict2=@{@"KeyA":@"Value1",
                          @"KeyB":@"Value2",
                          @"KeyC":@"Value3",
                          @"KeyD":@"Value4",
                          };
    NSDictionary *dict3=@{@"KeyA":@"ValueAAA",
                          @"KeyB":@"ValueBBB",
                          @"KeyC":@"ValueCCC",
                          @"KeyD":@"ValueDDD",
                          };
    NSMutableArray *myColors=[NSMutableArray arrayWithObjects:dict0,dict1,dict2,dict3,nil];
    NSMutableArray *fixColors=[NSMutableArray arrayWithArray:@[dict0,dict1,dict2,dict3]];
    NSLog(@"Now the array is: %@", myColors);
    NSLog(@"Array index 2 KeyC value is:%@",[[myColors objectAtIndex:2]objectForKey:@"KeyC"]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
