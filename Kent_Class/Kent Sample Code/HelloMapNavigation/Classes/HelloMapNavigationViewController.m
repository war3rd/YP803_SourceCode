//
//  HelloMapNavigationViewController.m
//  HelloMapNavigation
//
//  Created by Liu Kent on 2011/3/6.
//  Copyright 2011 SoftArt Lab. All rights reserved.
//

#import "HelloMapNavigationViewController.h"

@implementation HelloMapNavigationViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[textFieldFrom release];
	[textFieldTo release];
	
    [super dealloc];
}

-(IBAction) goNavigation {
	
	if(textFieldFrom.text==nil || [textFieldFrom.text length]==0)
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"請輸入出發地點！"
														   delegate:nil cancelButtonTitle:@"確認" otherButtonTitles: nil];		
		
		[alertView show];
		[alertView release];
		return;			
	}
	
	if(textFieldTo.text==nil || [textFieldTo.text length]==0)
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"請輸入目標地點！"
														   delegate:nil cancelButtonTitle:@"確認" otherButtonTitles: nil];		
		
		[alertView show];
		[alertView release];
		return;			
	}	

	NSString *stringURLContent=[NSString stringWithFormat:@"http://maps.google.com/maps?daddr=%@&saddr=%@" ,textFieldTo.text ,textFieldFrom.text];
								
	[[UIApplication sharedApplication] openURL: [NSURL URLWithString:[stringURLContent stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]];	
	
	
}

#pragma mark -
#pragma mark Keyboard Control Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	
	return YES;
	
}

@end
