//
//  ViewController.m
//  HelloAudioToolbox
//
//  Created by Kent Liu on 13/6/21.
//  Copyright (c) 2013年 Kent Liu. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()
{
    SystemSoundID soundFileObject;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *soundURL=[[NSBundle mainBundle] URLForResource:@"worldclear" withExtension:@"wav"];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(soundURL), &soundFileObject);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)vibrateButtonPressed:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)soundButtonPressed:(id)sender {
    AudioServicesPlaySystemSound(soundFileObject);
}
@end





