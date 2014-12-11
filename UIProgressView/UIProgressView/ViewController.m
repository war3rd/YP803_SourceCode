//
//  ViewController.m
//  UIProgressView
//
//  Created by BigkongWang on 2014/9/15.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer *myTimer;
}
@property (strong, nonatomic) IBOutlet UIProgressView *myProgressView;

@end

@implementation ViewController
- (IBAction)toClick:(id)sender {
    [_myProgressView setHidden:NO];
    [_myProgressView setProgress:0];
    myTimer=[NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(changeValue:) userInfo:nil repeats:YES];//OR delete [myTimer=]
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    _myProgressView.hidden=YES;
    NSLog(@"%ld",(long)buttonIndex);
}
-(void) changeValue:(id)sender{
    [_myProgressView setProgress:_myProgressView.progress+0.1 ];
    if(_myProgressView.progress==1){
        [myTimer invalidate];//OR [sender invalidate];
        //[_myProgressView setHidden:YES];
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"Upload Finish" message:@"訊息區"delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"OK1",@"OK2",@"OK3",nil];
        [alertView show];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
