//
//  MyUIImageView.m
//  HelloHTTPGetASync
//
//  Created by Liu Kent on 2011/4/5.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "MyUIImageView.h"


@implementation MyUIImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CGRect rectSubView=frame;
        
        rectSubView.origin.x=0;
        rectSubView.origin.y=0;
        
        imageView=[[UIImageView alloc] initWithFrame:rectSubView];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:imageView];
        
        activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        activityView.frame=rectSubView;
        [self addSubview:activityView];
        activityView.hidesWhenStopped=YES;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [activityView removeFromSuperview];
    [activityView release];
    [imageView removeFromSuperview];
    [imageView release];
    [respondData release];
    [super dealloc];
}


- (void) showImageWithURL:(NSURL*) urlImageFile {
    
    NSURLRequest *theRequest=[[NSURLRequest alloc ] initWithURL:urlImageFile
                                                    cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                timeoutInterval:60.0];
    
    NSURLConnection *theConnection=[NSURLConnection
                                    connectionWithRequest:theRequest delegate:self];
    
    if (theConnection) {
        
        respondData=[[NSMutableData data] retain];

    } else {
        // Pop-up Error Message
    }
    
    [theRequest release];
    
    [activityView startAnimating];
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [respondData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data
{
    [respondData appendData:data]; //  Data will be appended to here!
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError*)error
{
    // Show error message
    
    // respondData need to be released if fail!
    [respondData release];
    respondData=nil;
    
    [activityView stopAnimating];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIImage *imageObject=[UIImage imageWithData:respondData];
    
    [imageView setImage:imageObject];
    
    // Release respondData
    [respondData release];
    respondData=nil;
    
    [activityView stopAnimating];
}


@end
