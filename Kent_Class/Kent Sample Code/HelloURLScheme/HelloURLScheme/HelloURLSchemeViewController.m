//
//  HelloURLSchemeViewController.m
//  HelloURLScheme
//
//  Created by Liu Kent on 2011/3/30.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloURLSchemeViewController.h"

@interface HelloURLSchemeViewController (private)

- (void) launchURLSchemeAction:(NSString*) stringURLScheme;

@end


@implementation HelloURLSchemeViewController

- (void)dealloc
{
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) launchURLSchemeAction:(NSString*) stringURLScheme {
    
    NSString *stringURLContent=[NSString
                                stringWithFormat:@"%@",stringURLScheme];
    
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:[stringURLContent stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]];	
    
}

-(IBAction) launchURLScheme:(id)sender {
    UIButton *button=(UIButton*)sender;
    
    NSString *stringURLScheme=nil;
    
    switch (button.tag) {
        case 0:
            stringURLScheme=@"http://maps.google.com/maps?q=starbucks";
            break;
        case 1:
            stringURLScheme=@"tel:0911111111";
            break;
        case 2:
            stringURLScheme=@"sms:0911111111";
            break;
        case 3:
            stringURLScheme=@"mailto:abc@gmail.com?cc=def@gmail.com&subject=Hello!!&body=Good Morning";
            break;
        case 4:
            stringURLScheme=@"http://www.youtube.com/watch?v=F1rPFbEoJVc";
            break; 
        case 5:
            stringURLScheme=@"http://itunes.apple.com/tw/app/angry-birds/id343200656?mt=8";
            break;             
            
        default:
            break;
    }
    
    if(stringURLScheme!=nil)
        [self launchURLSchemeAction:stringURLScheme];
    
}


@end
