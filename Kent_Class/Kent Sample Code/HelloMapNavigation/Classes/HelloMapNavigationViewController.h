//
//  HelloMapNavigationViewController.h
//  HelloMapNavigation
//
//  Created by Liu Kent on 2011/3/6.
//  Copyright 2011 SoftArt Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloMapNavigationViewController : UIViewController {

	IBOutlet UITextField *textFieldFrom;
	IBOutlet UITextField *textFieldTo;	
	
}

-(IBAction) goNavigation;

@end

