//
//  MasterViewController.m
//  HelloMyGoogleDrive
//
//  Created by Kent Liu on 2014/5/16.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "GTLDrive.h"
#import "GTMOAuth2ViewControllerTouch.h"

static NSString *const kKeychainItemName = @"KentTestGoogleDrive";
static NSString *const kClientID = @"422718719418-6gh9ic39f0lj3eretr0qhfprp6fvv6vo.apps.googleusercontent.com";
static NSString *const kClientSecret = @"8jgJ_Z9vTZ8gqyjhJlaxbK3h";

@interface MasterViewController () {
    NSMutableArray *_objects;
    GTLServiceDrive *driveService;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    // Preare driveService
    
    driveService=[GTLServiceDrive new];
    driveService.authorizer=[GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:kKeychainItemName clientID:kClientID clientSecret:kClientSecret];
    
    if([driveService.authorizer canAuthorize]==NO)
    {
        GTMOAuth2ViewControllerTouch *controller;
        controller=[[GTMOAuth2ViewControllerTouch alloc] initWithScope:kGTLAuthScopeDriveFile
                 clientID:kClientID
             clientSecret:kClientSecret
         keychainItemName:kKeychainItemName
        completionHandler:^(GTMOAuth2ViewControllerTouch *viewController, GTMOAuth2Authentication *auth, NSError *error) {
            
            if(error)
            {
                NSLog(@"Authorization Fail. (%@)",[error description]);
                driveService.authorizer=nil;
            }
            else
            {
                NSLog(@"Authorization Successfully.");
                driveService.authorizer=auth;
                [self refreshList];
            }
            
        }];
        
        [self.navigationController pushViewController:controller animated:YES];
    }
    else
    {
        [self refreshList];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    [self uploadPhoto];
}

- (void) uploadPhoto {
    // Prepare Upload Data
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"Jobs" ofType:@"png"];
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    // Prepare GTLDriveFile
    GTLDriveFile *file=[GTLDriveFile object];
    file.title=[NSString stringWithFormat:@"KentClass_%@",[[NSDate date] description] ];
    file.descriptionProperty=@"KentClassUpload";
    file.mimeType=@"image/png";
    
    GTLUploadParameters *parameters=[GTLUploadParameters uploadParametersWithData:data MIMEType:file.mimeType];
    GTLQueryDrive *query=[GTLQueryDrive queryForFilesInsertWithObject:file uploadParameters:parameters];
    
    [driveService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
       
        if(error)
        {
            NSLog(@"Upload Fail. (%@)",[error description]);
        }
        else
        {
            NSLog(@"Upload Success. (FileID: %@)",[object identifier]);
            [self refreshList];
        }
        
    }];
    
    
    
}

- (void) refreshList {
    
    if(_objects==nil)
        _objects=[NSMutableArray new];
    else
        [_objects removeAllObjects];
    
    driveService.shouldFetchNextPages=YES;
    GTLQueryDrive *query=[GTLQueryDrive queryForChildrenListWithFolderId:@"root"];
    GTLServiceTicket *ticket=[driveService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
        
        if(error)
        {
            NSLog(@"Query List Fail.(%@)",[error description]);
        }
        else
        {
            for(GTLDriveChildReference *child in object)
            {
                NSLog(@"File ID: %@",child.identifier);
                [_objects addObject:child.identifier];
            }
            
            [self.tableView reloadData];
        }
        
    }];
}

-(void) deletePhotoWithFileID:(NSString*)targetID {
    
    GTLQueryDrive *query = [GTLQueryDrive queryForChildrenDeleteWithFolderId:@"root" childId:targetID];
    [driveService executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
       
        if(error)
        {
            NSLog(@"Delete Fail.(%@)",[error description]);
        }
        else
        {
            NSLog(@"Delete Successfully.");
//            [self refreshList];
        }
    }];
    
    
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Remove from Google Drive
        [self deletePhotoWithFileID:_objects[indexPath.row]];
        
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDriveService:driveService];
        
        id object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];

    }
}

@end
