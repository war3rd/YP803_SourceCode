//
//  DetailViewController.m
//  HelloDropbox2
//
//  Created by Kent Liu on 2014/5/15.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()
{
    DBRestClient *restClient;
}
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Create restClient
    restClient=[[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    restClient.delegate=self;
    
    // Download File
    NSString *srcFilePath=[NSString stringWithFormat:@"/%@",_detailItem];
    NSString *tmpFilPath=[NSTemporaryDirectory() stringByAppendingPathComponent:@"tmp.png"];
    
    [restClient loadFile:srcFilePath intoPath:tmpFilPath];
    
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DBRestClient Protocol Methods

- (void) restClient:(DBRestClient *)client loadedFile:(NSString *)destPath contentType:(NSString *)contentType metadata:(DBMetadata *)metadata {
    
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:destPath];
    _resultImageView.image=image;
    [self performSelector:@selector(delayRemoveFile:) withObject:destPath afterDelay:0.3];
}

- (void) delayRemoveFile:(NSString*)filePath {
    // Remove file if it is not used anymore.
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

- (void) restClient:(DBRestClient *)client loadFileFailedWithError:(NSError *)error {
    NSLog(@"Fail to download: %@",[error description]);
}


@end







