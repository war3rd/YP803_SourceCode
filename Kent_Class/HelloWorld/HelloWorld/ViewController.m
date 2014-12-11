//
//  ViewController.m
//  HelloWorld
//
//  Created by BigkongWang on 2014/9/25.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //Memory不足時，釋放記憶體動作
}

- (IBAction)goButtonPress:(id)sender {
    [_theLabel setText:@"Good evening!"];
    _theLabel.text=@"HaHa!!";
    [sender setTitle:@"fasdfsdf"]; //Sender 無法處理但也不會Crash
    //[sender setSelectedSegmentIndex:8];//Sender 無法處理但是程式會Crash
   // [sender setTitle:@"Hi!" forState:UIControlStateNormal];
    [self performSelector:@selector(delayJob:) withObject:sender afterDelay:3.0];//withObject是參數，一次只能傳一個，多個參數可以包成陣列。
    NSLog(@"%@",[sender description]);
}


-(void) delayJob:(id)targetObject{
    [targetObject setTitle:@"Good Night!" forState:UIControlStateNormal];
}
@end
