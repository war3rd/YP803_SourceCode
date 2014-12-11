//
//  ViewController2.m
//  ViewTransititon
//
//  Created by BigkongWang on 2014/9/23.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIView *viewPurple;
@property (weak, nonatomic) IBOutlet UIView *viewRed;

@end

@implementation ViewController2
- (IBAction)PtoR_Action:(id)sender {
    [UIView transitionFromView:_viewPurple
                        toView:_viewRed
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCurlUp |UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                            //
                    }];
}
- (IBAction)RtoP_Action:(id)sender {
    [UIView transitionFromView:_viewRed
                        toView:_viewPurple
                      duration:1.0f
                       options:UIViewAnimationOptionTransitionCurlUp |UIViewAnimationOptionShowHideTransitionViews
                    completion:^(BOOL finished) {
                        //
                    }];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
