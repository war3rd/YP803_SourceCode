//
//  HelloPlayMovieViewController.h
//  HelloPlayMovie
//
//  Created by Liu Kent on 2011/3/23.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface HelloPlayMovieViewController : UIViewController {
    
     UIAlertView *preparingAlertView;	
}
@property (retain, nonatomic) IBOutlet UIImageView *thumbnailImageView;

- (IBAction) playRemoteMovie;
- (IBAction) playLocalMovie;
- (IBAction) playRemoteMusic;
- (IBAction)getThumbnail:(id)sender;

@end
