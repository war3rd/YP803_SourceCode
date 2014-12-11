//
//  ViewController.m
//  linkParse
//
//  Created by richman on 2014/10/21.
//  Copyright (c) 2014年 richman. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}
- (IBAction)linkParseAction:(id)sender {

    PFObject *testObject = [PFObject objectWithClassName:@"TestObject2"];
    testObject[@"foo2"] = @"bar2";
    [testObject saveInBackground];
    
    
}
- (IBAction)deleteAction:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"TestObject2"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        //
        if (error==nil) {
            //NSLog(@"%@",objects);
            NSMutableArray *myArray=[objects mutableCopy];
            for (PFObject *obj in myArray) {
                NSLog(@"%@",[obj objectForKey:@"foo2"]);
                NSLog(@"%@",[obj valueForKey:@"objectId"]);
                //NSString *str=[NSString stringWithFormat:@"%@",[obj valueForKey:@"objectId"]];
                [obj deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (!error) {
                        NSLog(@"Delete");
                    }
                }];
                //NSAttributedString;
                //PFObject *testObj=[PFObject objectWithoutDataWithObjectId:str];
//                [testObj deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                    if (!error) {
//                        NSLog(@"Delete");
//                    }
//                }];
            
            }
        }else{
            //TODO: Exception process
            /*
             2014-10-21 18:03:25.861 linkParse[11515:420180] (
             "<TestObject2: 0x7fb9886933d0, objectId: 8TX0eChScG, localId: (null)> {\n    foo2 = bar2;\n}",
             "<TestObject2: 0x7fb9886df8b0, objectId: 6TBZQqYEjo, localId: (null)> {\n    foo2 = bar2;\n}",
             "<TestObject2: 0x7fb9886cf930, objectId: QETQU0skX5, localId: (null)> {\n    foo2 = bar2;\n}",
             "<TestObject2: 0x7fb9886e51b0, objectId: yJRmloJG4o, localId: (null)> {\n    foo2 = bar2;\n}",
             "<TestObject2: 0x7fb9886e1130, objectId: z5AbwrHwN6, localId: (null)> {\n    foo2 = bar2;\n}"
             )

             
             
             2014-10-21 18:00:51.431 linkParse[11472:419172] <TestObject2: 0x7fb23862ba30, objectId: z5AbwrHwN6, localId: (null)> {
             foo2 = bar2;
             }
             */
        }
        
    }];
    /*
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject2"];
    [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!succeeded) {
            NSLog(@"%@",error);
        }
    }];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
