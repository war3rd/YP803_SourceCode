//
//  homeWorksTableViewController.m
//  linkParse
//
//  Created by richman on 2014/10/22.
//  Copyright (c) 2014年 richman. All rights reserved.
//

#import "homeWorksTableViewController.h"
#import <Parse/Parse.h>
static NSString * const kGetContactContent=@"http://localhost/ComunicationBook/getHomeWorks.php";

@interface homeWorksTableViewController (){
    NSMutableArray *parseArray;
}

@end

@implementation homeWorksTableViewController
-(void)refreshTableView{
    NSLog(@"refreshTable");
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSURL *url=[NSURL URLWithString:kGetContactContent];
    NSMutableURLRequest *request =[NSMutableURLRequest
                                   requestWithURL:url
                                   cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                   timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    NSString *stringPost=[NSString stringWithFormat:@"ClassName=ContactContent"];//多參數寫法@"qrcode=%@&param2=%@&param3=%@" 要加&隔開
    [request setHTTPBody:[stringPost dataUsingEncoding:NSUTF8StringEncoding]];
    NSOperationQueue *queue= [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([data length]>0 && connectionError==nil) {
            parseArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"%@",parseArray);
            //NSLog(@"%ld",[[[parseArray objectAtIndex:0]objectForKey:@"HomeWorks"]count]);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"非同步BLOCK資料下載" message:@"下載完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//                [alert show];
//            });
            [self refreshTableView];
            
        } else if([data length]==0 && connectionError==nil) {
            
        } else if(connectionError!=nil){
            
        }
    }];

    
    /*
    PFQuery *query= [PFQuery queryWithClassName:@"ContactContent"];
    NSLog(@"123");

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *obj in objects) {
               // NSLog(@"obj:%@",obj);
                NSLog(@"Class is:%@",[[obj objectForKey:@"CarryItems"]class]);
 
            }
        }else{
            NSLog(@"error:%@",error);
        }
    }];
    
    */
    
    /*
     
     <ContactContent: 0x7fdbb0c8af90, objectId: wkT0wYg56g, localId: (null)> {
     CameraMark = 0;
     CarryItems =     (
     CarryItems1,
     CarryItems2,
     CarryItems3
     );
     ComunicationThings =     (
     ComunicationThings1,
     ComunicationThings2,
     ComunicationThings3
     );
     Date = "2014-10-19 07:33:00 +0000";
     DestinationClass = class1;
     DestinationLevel = level1;
     DestinationSchool = School1;
     FinishMark = 0;
     HomeWorks =     (
     Homework1,
     Homework2,
     Homework3
     );
     Notices =     (
     Notice1,
     Notice2,
     Notice3
     );
     }

     
     
     
     
     (
     "<ContactContent: 0x7fb63270e750, objectId: wkT0wYg56g, localId: (null)> {\n    CameraMark = 0;\n    CarryItems =     (\n        CarryItems1,\n        CarryItems2,\n        CarryItems3\n    );\n    ComunicationThings =     (\n        ComunicationThings1,\n        ComunicationThings2,\n        ComunicationThings3\n    );\n    Date = \"2014-10-19 07:33:00 +0000\";\n    DestinationClass = class1;\n    DestinationLevel = level1;\n    DestinationSchool = School1;\n    FinishMark = 0;\n    HomeWorks =     (\n        Homework1,\n        Homework2,\n        Homework3\n    );\n    Notices =     (\n        Notice1,\n        Notice2,\n        Notice3\n    );\n}"
     )

     */
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (parseArray!=nil) {
        //NSLog(@"%ld",[[[parseArray objectAtIndex:0]objectForKey:@"HomeWorks"]count]);
        return [[[parseArray objectAtIndex:0]objectForKey:@"HomeWorks"]count];
    }else{
        return 0;
    }
        //return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"homeWorkCell"];
    cell.textLabel.text=[[[parseArray objectAtIndex:0]objectForKey:@"HomeWorks"]objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
