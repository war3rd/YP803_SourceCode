//
//  ViewController.m
//  UISlider
//
//  Created by BigkongWang on 2014/9/1.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
   // rotationAngle;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UILabel *valueLable;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation ViewController
- (IBAction)sliderValueChanged:(UISlider *)sender {
    _valueLable.text= [NSString stringWithFormat:@"%.2f",_mySlider.value];
}
- (IBAction)toRotation:(id)sender {
    //Slider Rotation
    if(_mySlider.value <1){
        _mySlider.value+=0.1;
    }else{
        _mySlider.value=0.1;
    }
    CGAffineTransform trans = CGAffineTransformMakeRotation((M_PI*_mySlider.value));
    _mySlider.transform=trans;
    _valueLable.text=[NSString stringWithFormat:@"%.2f",_mySlider.value];
}
- (IBAction)autoRotation:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(autoRotationMethod:)
                                   userInfo:nil repeats:YES];
    _valueLable.text=[NSString stringWithFormat:@"%.2f",_mySlider.value];}
-(void)autoRotationMethod:(id)sender{
    NSLog(@"autoRotationMethod!!!");
    if(_mySlider.value <1){
        _mySlider.value+=0.1;
    }else{
        _mySlider.value=0.1;
    }
    CGAffineTransform trans = CGAffineTransformMakeRotation((M_PI*_mySlider.value));
    _mySlider.transform=trans;
    _valueLable.text=[NSString stringWithFormat:@"%.2f",_mySlider.value];
}
- (IBAction)UIStepper:(UIStepper*)sender {
    
    _mySlider.value=sender.value;
    _valueLable.text=[NSString stringWithFormat:@"%.2f",_mySlider.value];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _valueLable.text= [NSString stringWithFormat:@"%.2f",0.00];
    _mySlider.value=0;
/*    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(autoRotationMethod:)
                                   userInfo:nil repeats:YES];
*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
