//
//  ViewController3.m
//  ViewTransititon
//
//  Created by BigkongWang on 2014/9/23.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@property (weak, nonatomic) IBOutlet UIImageView *imageEffectView;
@end

@implementation ViewController3
- (IBAction)rippleAction:(id)sender {
    CATransition *anim= [CATransition animation];
    anim.delegate=self;
    anim.duration=1.0f;
    anim.type=@"rippleEffect";
    [[_imageEffectView layer] addAnimation:anim forKey:@"RippleEffect"];
}
- (IBAction)suckAction:(id)sender {
    CATransition *anim= [CATransition animation];
    anim.delegate=self;
    anim.duration=1.0f;
    anim.type=@"suckEffect";
    [[_imageEffectView layer] addAnimation:anim forKey:@"SuckEffect"];
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
