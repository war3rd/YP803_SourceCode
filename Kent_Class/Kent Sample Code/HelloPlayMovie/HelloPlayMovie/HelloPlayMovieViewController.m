//
//  HelloPlayMovieViewController.m
//  HelloPlayMovie
//
//  Created by Liu Kent on 2011/3/23.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloPlayMovieViewController.h"


@interface  HelloPlayMovieViewController (Private)

- (void) playMovieWithURL: (NSURL*) theURL;
- (void) launchPreparingAlertViewAlert;
- (void) dismissPreparingAlert;
@end


@implementation HelloPlayMovieViewController

- (void)dealloc
{
    [_thumbnailImageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    return YES;
}

- (IBAction) playRemoteMovie {
    
    [self playMovieWithURL:[NSURL URLWithString:@"http://184.72.239.149/vod/smil:bigbuckbunnyiphone.smil/playlist.m3u8"]];
}
                              
                    
- (IBAction) playLocalMovie {
    NSString *filePathName = [[NSBundle mainBundle]
                              pathForResource:@"the-smartest-smartphone" ofType:@"mp4"];
    
#if 0
    if(UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(filePathName)==YES)
    {
        UISaveVideoAtPathToSavedPhotosAlbum(filePathName, nil, nil, nil);
    }
#endif
    
    [self playMovieWithURL:[NSURL fileURLWithPath:filePathName]];
}

- (IBAction) playRemoteMusic {
    
    [self playMovieWithURL:[NSURL URLWithString:@"http://dl.dropbox.com/u/12116609/00_KentClass/Sample.mp3"]];
}

- (IBAction)getThumbnail:(id)sender {
    
    NSString *filePathName = [[NSBundle mainBundle]
                              pathForResource:@"the-smartest-smartphone" ofType:@"mp4"];
    
    
    MPMoviePlayerController* moviePlayer;
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: [NSURL fileURLWithPath:filePathName]];
    
    [[NSNotificationCenter defaultCenter]   addObserver: self
                                               selector: @selector(requestThumbnailDidFinish:)
                                                   name: MPMoviePlayerThumbnailImageRequestDidFinishNotification
                                                 object: nil];
    
    NSArray *timesArray=@[[NSNumber numberWithFloat:23.5]];
    
    [moviePlayer requestThumbnailImagesAtTimes:timesArray timeOption:MPMovieTimeOptionExact];
    
    moviePlayer.shouldAutoplay=NO;  // Set as NO if you don't want it be played automatically.
}


-(void) playMovieWithURL: (NSURL*) theURL {
    
    MPMoviePlayerController* moviePlayer;
    
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: theURL];

    // Setup the player
    moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
   
    // Add Movie Player to parent's view
    [moviePlayer.view setFrame:self.view.bounds];  
    moviePlayer.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:moviePlayer.view];	
    
 
    // Register for the playback finished notification
    
    [[NSNotificationCenter defaultCenter]   addObserver: self
                                               selector: @selector(moviePreloadDidFinish:)
                                                   name: MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                 object: moviePlayer];    
    
    [[NSNotificationCenter defaultCenter]   addObserver: self
                                               selector: @selector(moviePlayBackDidFinish:)
                                                   name: MPMoviePlayerPlaybackDidFinishNotification
                                                 object: moviePlayer];
    
    
    [moviePlayer prepareToPlay];
    [moviePlayer play];
//    [moviePlayer setFullscreen:YES animated:YES];
    
    [self launchPreparingAlertViewAlert];
    
}

#pragma mark -
#pragma mark Media Playback Notification Methods

- (void) moviePreloadDidFinish:(NSNotification*)notification
{
	NSLog(@"MV Preload done!");
		
    [self dismissPreparingAlert];
}

-(void) moviePlayBackDidFinish: (NSNotification*) aNotification
{
    MPMoviePlayerController* moviePlayer=[aNotification object];
  
    // UnRegister for the playback finished notification
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                                  object: moviePlayer];

    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: MPMoviePlayerPlaybackDidFinishNotification
                                                  object: moviePlayer];    
    
    // Remove from the parent's view
    [moviePlayer.view removeFromSuperview];

    // Stop before release to workaround iOS's bug
    [moviePlayer stop];
    
    // Release the movie instance created in playMovieWithURL:
    [moviePlayer release];
    
}

- (void) requestThumbnailDidFinish:(NSNotification*) aNotification
{
    
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: MPMoviePlayerThumbnailImageRequestDidFinishNotification
                                                  object: nil];
    
    MPMoviePlayerController* moviePlayer=[aNotification object];
    
    NSDictionary *userInfo=aNotification.userInfo;
    
    if(userInfo[MPMoviePlayerThumbnailImageKey]!=nil)
    {
        _thumbnailImageView.image=userInfo[MPMoviePlayerThumbnailImageKey];
    }
    
    
    // Release the movie instance created in getThumbnail:
    [moviePlayer release];
}

#pragma mark -
#pragma mark preparingAlertView Methods

- (void) launchPreparingAlertViewAlert {
	// Launch Downloading Alert
	if(preparingAlertView!=nil)	// Don't need to launch again
		return;
	
	preparingAlertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Movie Preparing..."
												  delegate:self cancelButtonTitle:nil otherButtonTitles: nil];		
	
	
	UIActivityIndicatorView *waitView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	waitView.frame = CGRectMake(120, 50, 40, 40);
	[waitView startAnimating];
	
	[preparingAlertView addSubview:waitView];
	[waitView release];
	
	[preparingAlertView show];			
	
}

- (void) dismissPreparingAlert {
	if(preparingAlertView!=nil)
	{
		// Dismiss Downloading alert
		[preparingAlertView dismissWithClickedButtonIndex:0 animated:YES];//important
		[preparingAlertView release];	
		preparingAlertView=nil;
		
	}	
	
}

@end
