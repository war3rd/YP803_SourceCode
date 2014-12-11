//
//  DetailViewController.m
//  HelloiPadUI
//
//  Created by Liu Kent on 2011/3/16.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "DetailViewController.h"

#import "RootViewController.h"

@interface DetailViewController ()
@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;

// For Popover for button
@property (nonatomic, retain) UIPopoverController *popoverControllerForButton;
- (void) selectTheFirstButton;
- (void) selectTheSecondButton;
@end

@implementation DetailViewController

@synthesize toolbar=_toolbar;

@synthesize detailItem=_detailItem;

@synthesize detailDescriptionLabel=_detailDescriptionLabel;

@synthesize popoverController=_myPopoverController;

@synthesize popoverControllerForButton=_popoverControllerForButton;

#pragma mark - Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    self.detailDescriptionLabel.text = [self.detailItem description];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    // Dismiss PopoverController if rotate
    if(self.popoverControllerForButton!=nil)
        [self.popoverControllerForButton dismissPopoverAnimated:YES];    
}

#pragma mark - Split view support

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController: (UIPopoverController *)pc
{
    barButtonItem.title = @"Events";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}

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
	self.popoverController = nil;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_popoverControllerForButton release];
    [_myPopoverController release];
    [_toolbar release];
    [_detailItem release];
    [_detailDescriptionLabel release];
    
    [viewForPopover release];
    [super dealloc];
}

#pragma mark - For Popover Methods

-(IBAction) showPopoverOfButton1:(id)sender{
	UIButton *button=(UIButton*)sender;
	
	//build our custom popover view
	UIViewController* popoverContent = [[UIViewController alloc]
										init];
	UIView* popoverView = [[UIView alloc]
						   initWithFrame:CGRectMake(0, 0, 300, 100)];
//	popoverView.backgroundColor = [UIColor blackColor];
	popoverContent.view = popoverView;
	
	// build buttons
	
	UIButton *selectTaiwanButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	selectTaiwanButton.frame=CGRectMake(0,0,300,50);
	[selectTaiwanButton setTitle:@"The First button" forState:UIControlStateNormal];
	[selectTaiwanButton setBackgroundColor:[UIColor clearColor]];
	[selectTaiwanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[selectTaiwanButton addTarget:self action:@selector(selectTheFirstButton) forControlEvents:UIControlEventTouchUpInside];
	[popoverView addSubview:selectTaiwanButton];
	
	UIButton *selectForeignButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
	selectForeignButton.frame=CGRectMake(0,50,300,50);
	[selectForeignButton setTitle:@"The Second button" forState:UIControlStateNormal];
	[selectForeignButton setBackgroundColor:[UIColor clearColor]];
	[selectForeignButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[selectForeignButton addTarget:self action:@selector(selectTheSecondButton) forControlEvents:UIControlEventTouchUpInside];
	[popoverView addSubview:selectForeignButton];	
	
	
	//resize the popover view shown
	//in the current view to the view's size
	popoverContent.contentSizeForViewInPopover = CGSizeMake(300,100);
	
	//create a popover controller
	UIPopoverController *newPopoverController= [[UIPopoverController alloc]
							  initWithContentViewController:popoverContent];
	
    self.popoverControllerForButton = newPopoverController;
    
	//present the popover view non-modal with a
	//refrence to the button pressed within the current view
	[self.popoverControllerForButton presentPopoverFromRect:button.frame
											inView:[button superview]
						  permittedArrowDirections:UIPopoverArrowDirectionAny
										  animated:YES];
	
	self.popoverControllerForButton.delegate=self;
	
	//release the popover content
    [newPopoverController release];
	[popoverView release];
	[popoverContent release];
	
}

- (void) selectTheFirstButton {
    
    [self.popoverControllerForButton dismissPopoverAnimated:YES];
    self.popoverControllerForButton=nil;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"The First Button Click!"
                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];	
    [alert release];	
    
}

- (void) selectTheSecondButton {
    
    [self.popoverControllerForButton dismissPopoverAnimated:YES];    
    self.popoverControllerForButton=nil;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"The Second Button Click!"
                                                   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];	
    [alert release];	
    
}

-(IBAction) showPopoverOfButton2:(id)sender{
	UIButton *button=(UIButton*)sender;
	
	//build our custom popover view
	UIViewController* popoverContent = [[UIViewController alloc]
										init];
	popoverContent.view = viewForPopover;
	
	//resize the popover view shown
	//in the current view to the view's size
	popoverContent.contentSizeForViewInPopover = CGSizeMake(viewForPopover.frame.size.width,viewForPopover.frame.size.height);
	
	//create a popover controller
	UIPopoverController *newPopoverController= [[UIPopoverController alloc]
                                                initWithContentViewController:popoverContent];
	
    self.popoverControllerForButton = newPopoverController;
    
	//present the popover view non-modal with a
	//refrence to the button pressed within the current view
	[self.popoverControllerForButton presentPopoverFromRect:button.frame
                                                     inView:[button superview]
                                   permittedArrowDirections:UIPopoverArrowDirectionAny
                                                   animated:YES];
	
	self.popoverControllerForButton.delegate=self;
	
	//release the popover content
    [newPopoverController release];
	[popoverContent release];
	
}


#pragma mark - UIPopoverControllerDelegate Methods

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
    
    self.popoverControllerForButton=nil; 
}

@end
