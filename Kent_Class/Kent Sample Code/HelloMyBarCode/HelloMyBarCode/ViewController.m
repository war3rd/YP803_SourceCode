//
//  ViewController.m
//  HelloMyBarCode
//
//  Created by Kent Liu on 13/12/29.
//  Copyright (c) 2013年 Kent Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    ZBarReaderViewController *reader;
}
@end

@implementation ViewController

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

- (IBAction)scanButtonPressed:(id)sender {
    
    if(reader==nil)
    {
        reader=[ZBarReaderViewController new];
        reader.readerDelegate=self;
        
        ZBarImageScanner *scanner=reader.scanner;
        
        [scanner setSymbology:ZBAR_I25
                       config:ZBAR_CFG_ENABLE
                           to:0];
    }
    
    [self presentViewController:reader
                       animated:YES
                     completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    id <NSFastEnumeration> results = info[ZBarReaderControllerResults];
    
    ZBarSymbol *symbol=nil;
    for(symbol in results)
        break;
    
    _resultTextView.text=symbol.data;
    
    _resultImageView.image=info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end













