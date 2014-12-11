//
//  ViewController.m
//  HelloAVFoundation
//
//  Created by Kent Liu on 13/8/31.
//  Copyright (c) 2013年 Kent Liu. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *musicPlayer;
    AVAudioRecorder *voiceRecorder;
    AVAudioPlayer *voicePlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if(musicPlayer==nil)
    {
        NSURL *fileURL=[[NSBundle mainBundle] URLForResource:@"Dora" withExtension:@"mp3"];
        musicPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        
        musicPlayer.numberOfLoops=-1;
        [musicPlayer prepareToPlay];
        
        // Setup Audio Session
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    }
    
    // At iOS7,need to have users' permission.
    
    // Check if the iOS support this new method.
    AVAudioSession *instance=[AVAudioSession sharedInstance];
    if([instance respondsToSelector:@selector(requestRecordPermission:)])
    {
        [instance requestRecordPermission:^(BOOL granted) {
           
            NSString *message=nil;
            
            if(granted)
            {
                message=@"User granted the permission.";
            }
            else
            {
                message=@"User did not grant the permission.";
            }
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alertView show];
            
        }];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playButtonPressed:(id)sender {
    
    if([musicPlayer isPlaying])
    {
        [sender setTitle:@"Play Music" forState:UIControlStateNormal];
        [musicPlayer pause];
    }
    else
    {
        [sender setTitle:@"Stop Music" forState:UIControlStateNormal];
        [musicPlayer play];
    }

}

- (IBAction)recordVoiceButtonPressed:(id)sender {
    
    if([voiceRecorder isRecording])
    {
        [sender setTitle:@"Record Voice" forState:UIControlStateNormal];        
        [voiceRecorder stop];
        voiceRecorder=nil;
    }
    else
    {
        [sender setTitle:@"Stop Recording" forState:UIControlStateNormal];
        [self prepareRecording];
        [voiceRecorder record];
    }
}

- (void) prepareRecording {
    
    NSDictionary *settings=
  @{AVFormatIDKey: [NSNumber numberWithInt:kAudioFormatAppleIMA4],
    AVSampleRateKey: [NSNumber numberWithFloat:22050.0],
    AVNumberOfChannelsKey: [NSNumber numberWithInt:1],
    AVLinearPCMBitDepthKey: [NSNumber numberWithInt:16],
    AVLinearPCMIsBigEndianKey: [NSNumber numberWithBool:NO],
    AVLinearPCMIsFloatKey: [NSNumber numberWithBool:NO]};
    
    // Decide Record File Path
    NSString *recordFilePath=[NSString stringWithFormat:@"%@/Documents/record.caf",NSHomeDirectory()];
    NSURL *recordFileURL=[NSURL fileURLWithPath:recordFilePath];
    NSLog(@"Record File Path: %@",recordFilePath);
    
    voiceRecorder=[[AVAudioRecorder alloc] initWithURL:recordFileURL settings:settings error:nil];
    
    [voiceRecorder prepareToRecord];
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
}


- (IBAction)playVoiceButtonPressed:(id)sender {
    
    if([voicePlayer isPlaying])
    {
        [sender setTitle:@"Play Voice" forState:UIControlStateNormal];
        [voicePlayer stop];
        voicePlayer=nil;
    }
    else
    {
        [sender setTitle:@"Stop Playing Voice" forState:UIControlStateNormal];
        NSString *recordFilePath=[NSString stringWithFormat:@"%@/Documents/record.caf",NSHomeDirectory()];
        NSURL *recordFileURL=[NSURL fileURLWithPath:recordFilePath];
        voicePlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:recordFileURL error:nil];
        voicePlayer.numberOfLoops=-1;
        [voicePlayer prepareToPlay];
        [voicePlayer play];
    }
    
}
@end







