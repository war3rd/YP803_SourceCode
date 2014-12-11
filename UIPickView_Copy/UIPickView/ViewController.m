//
//  ViewController.m
//  UIPickView
//
//  Created by BigkongWang on 2014/9/4.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *dataArray1,*dataArray2,*dataArray3;
}
@property (weak, nonatomic) IBOutlet UILabel *labelShow;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //return [dataArray1 objectAtIndex:row];
    if(component==0){
        return [dataArray1 objectAtIndex:row];
    }else if(component==1){
        return [dataArray2 objectAtIndex:row];
    }else{
        return [dataArray3 objectAtIndex:row];
    }
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
   // return 1;
    return 3;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   // return [dataArray1 count];
    if(component==0){
        return [dataArray1 count];
    }else if(component==1){
       return [dataArray2 count];
    }else{
        return [dataArray3 count];
    }
}
- (IBAction)buttonClick:(id)sender {
    _labelShow.text=[NSString stringWithFormat:@"%@,  %@  ,%@",[dataArray1 objectAtIndex:[_pickerView selectedRowInComponent:0]],[dataArray2 objectAtIndex:[_pickerView selectedRowInComponent:1]],[dataArray3 objectAtIndex:[_pickerView selectedRowInComponent:2]]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    dataArray1=[NSArray arrayWithObjects:@"雞腿",@"排骨",@"魚排",nil];
    dataArray2=[NSArray arrayWithObjects:@"蕃茄",@"柳丁",@"芭樂", nil];
    dataArray3=[NSArray arrayWithObjects:@"紅茶",@"奶茶",@"綠茶", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
