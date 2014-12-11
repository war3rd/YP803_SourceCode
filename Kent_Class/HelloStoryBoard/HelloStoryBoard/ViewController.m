//
//  ViewController.m
//  HelloStoryBoard
//
//  Created by BigkongWang on 2014/9/25.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"
#import "GreenViewController.h"
#import "MyData.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBarItem.badgeValue=@"午安!☀︎";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backToWhite:(UIStoryboardSegue *)segue{
    
}
-(BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender{
    return YES;
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"gogreen"]) {
        return YES;
    }else{
        return YES;
    }
}
- (IBAction)goByCodeButtonPressed:(id)sender {
    NSInteger targetIndex=arc4random()%3;
    switch (targetIndex) {
        case 0:
            [self performSegueWithIdentifier:@"goblue" sender:nil];
             break;
        case 1:
            [self performSegueWithIdentifier:@"goyellow"sender:nil];
             break;
        case 2:
            [self performSegueWithIdentifier:@"gogreen" sender:nil];
            break;
            //      
        default:
            break;
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"gogreen"]) {
    /*//須要import GreenViewController
        GreenViewController *viewController=segue.destinationViewController;
        viewController.dateTime=[NSDate date];
    */
        
        
    id viewController=segue.destinationViewController;//可以不用import GreenViewController
        [viewController setDateTime:[NSDate date]];
    //[viewController setValue:[NSDate date] forKey:@"dateTime"];//可以不用import GreenViewController
        
        MyData *data=[MyData sharedData];
        data.testString=@"HiHi";
        
    
    }

    
}
@end
