//
//  DetailViewController.m
//  HelloMyGoogleDrive
//
//  Created by Kent Liu on 2014/5/16.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        [self queryMetadataWithFileID:_detailItem];
        
        // Update the view.
        [self configureView];
    }
}

- (void) queryMetadataWithFileID:(NSString*)targetID {
    
    GTLQueryDrive *query = [GTLQueryDrive queryForFilesGetWithFileId:targetID];
    [_driveService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
       
        if(error)
        {
            NSLog(@"Query Fail.(%@)",[error description]);
        }
        else
        {
            NSLog(@"Query Successfully.");
            [self downloadFileWithDownloadURL:[object downloadUrl]];
        }
        
    }];
    
}

- (void) downloadFileWithDownloadURL:(NSString*) downloadURLString
{
    GTMHTTPFetcher *fetcher=[_driveService.fetcherService fetcherWithURLString:downloadURLString];
    
    [fetcher beginFetchWithCompletionHandler:^(NSData *data, NSError *error) {
        if(error)
        {
            NSLog(@"Download Fail.(%@)",[error description]);
        }
        else
        {
            UIImage *image=[UIImage imageWithData:data];
            _resultImageView.image=image;
        }
    }];
    
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
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
