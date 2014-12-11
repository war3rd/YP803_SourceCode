//
//  ViewController.m
//  UIDatePicker
//
//  Created by BigkongWang on 2014/9/4.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *dateLable;
@property (weak, nonatomic) IBOutlet UIDatePicker *myDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *showAge;

@end

@implementation ViewController
- (IBAction)valueChanged:(id)sender {
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    NSString *dateString=[dateFormatter stringFromDate:[_myDatePicker date]];
    _dateLable.text=dateString;
    
    
    //show age
    NSDate *now=[NSDate date];
    NSDateComponents *age=[[NSCalendar currentCalendar]
                           components:NSYearCalendarUnit
                           fromDate:[_myDatePicker date]
                           toDate:now
                           options:0];
    
    _showAge.text=[NSString stringWithFormat:@"%ld years old",(long)[age year]];
    
}
- (IBAction)toEnter:(id)sender {
    _myDatePicker.hidden==YES?[_myDatePicker setHidden:NO]:[_myDatePicker setHidden:YES];
}
- (IBAction)showToday:(id)sender {
    NSDate *today=[NSDate date];
    [_myDatePicker  setDate:today animated:YES];
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    NSString *dateString=[dateFormatter stringFromDate:[_myDatePicker date]];
    _dateLable.text=dateString;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_myDatePicker setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
