//
//  GreenViewController.m
//  HelloStoryBoard
//
//  Created by User on 2014/9/26.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "GreenViewController.h"
#import "MyData.h"

@interface GreenViewController ()

@end

@implementation GreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MyData *data=[MyData sharedData];
    _resultLabel.text=[NSString stringWithFormat:@"%@%@",data.testString,[_dateTime description]];
//    _resultLabel.text=[_dateTime  description];
}
/*
//Only use in Modal Mode
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backByCode:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Back Done");
    }];
}
@end
