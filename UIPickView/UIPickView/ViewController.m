//
//  ViewController.m
//  UIPickView
//
//  Created by BigkongWang on 2014/9/4.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableDictionary *data;
    NSArray *keys;
}
@property (weak, nonatomic) IBOutlet UILabel *labelShow;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //return [dataArray1 objectAtIndex:row];
    if(component==0){
        return [keys objectAtIndex:row];
    }else{
        NSString *key=[keys objectAtIndex:[_pickerView selectedRowInComponent:0]];
        NSArray *array=[data objectForKey:key];
        return [array objectAtIndex:row];
    }
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
   // return 1;
    return 2;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
   // return [dataArray1 count];
    if(component==0){
        return [keys count];
    }else{
        NSString *key=[keys objectAtIndex:[_pickerView selectedRowInComponent:0]];
        NSArray *array=[data objectForKey:key];
        return [array count];
    }

}

- (IBAction)buttonClick:(id)sender {
    /*_labelShow.text=[NSString stringWithFormat:@"%@,  %@  ,%@",[dataArray1 objectAtIndex:[_pickerView selectedRowInComponent:0]],[dataArray2 objectAtIndex:[_pickerView selectedRowInComponent:1]],[dataArray3 objectAtIndex:[_pickerView selectedRowInComponent:2]]];
     */
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data=[NSMutableDictionary new];
    [data setValue:@[@"牛肉麵",@"滷肉飯",@"水餃"] forKey:@"中式"];
    [data setValue:@[@"漢堡",@"牛排",@"披薩"] forKey:@"西式"];
    keys=[[data allKeys]sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2){return [obj1 caseInsensitiveCompare:obj2];}];
    
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component==0) {
        [_pickerView reloadComponent:1];
       // NSLog(@"ReloadComponent!!!!");
    }else{
        NSString *key=[keys objectAtIndex:[_pickerView selectedRowInComponent:0]];
        NSArray *array=[data objectForKey:key];
        _labelShow.text=[array objectAtIndex:row];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
