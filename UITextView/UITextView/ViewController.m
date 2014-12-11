//
//  ViewController.m
//  UITextView
//
//  Created by BigkongWang on 2014/9/4.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *prevText;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *undoBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBtn;
@property (weak, nonatomic) IBOutlet UITextView *bigTextView;
@end

@implementation ViewController
- (IBAction)undoButton:(UIBarButtonItem *)sender {
    _bigTextView.text=prevText;
    //_undoBtn.enabled=NO;
    //_doneBtn.enabled=NO;
}
- (IBAction)doneButton:(UIBarButtonItem *)sender {
    [_bigTextView resignFirstResponder];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //_bigTextView.delegate=self;
    [_bigTextView setDelegate:self];//或是在TEXTVIEW 關連到VIEW CONTROLLER
    _undoBtn.enabled=NO;
    _doneBtn.enabled=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    prevText=textView.text;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    _undoBtn.enabled=NO;
    _doneBtn.enabled=NO;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    _undoBtn.enabled=YES;
    _doneBtn.enabled=YES;
    return YES;
}
@end
