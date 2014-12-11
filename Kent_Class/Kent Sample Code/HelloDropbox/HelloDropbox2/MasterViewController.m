//
//  MasterViewController.m
//  HelloDropbox2
//
//  Created by Kent Liu on 2014/5/15.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "AppDelegate.h"

#import <DropboxSDK/DropboxSDK.h>


@interface MasterViewController () {
    NSMutableArray *_objects;
    DBSession *dbSession;
    DBRestClient *restClient;
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
    
    // Lister to Linked Notification
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadList) name:DROPBOX_LINKED_NOTIFICATION object:nil];
    
    // Prepare DBSession
    
    dbSession = [[DBSession alloc] initWithAppKey:@"ah8xke01pt9ke46" appSecret:@"fhtah0igk22kv14" root:kDBRootAppFolder];
    [DBSession setSharedSession:dbSession];
    
    // Perform Login?
    
    if([dbSession isLinked]==NO)
    {
        [dbSession linkFromController:self];
    }
    else
    {
        [self reloadList];
    }
    
}

- (void) reloadList {
    
    if(restClient==nil)
    {
        restClient=[[DBRestClient alloc] initWithSession:dbSession];
        restClient.delegate=self;
    }
    
    [restClient loadMetadata:@"/"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
/*
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
*/
    
    NSString *fileName=[NSString stringWithFormat:@"%@.png",[[NSDate date] description]];
    
    NSString *localFilePath=[[NSBundle mainBundle] pathForResource:@"Jobs" ofType:@"png"];
    
    NSString *destPath = @"/";
    
    [restClient uploadFile:fileName
                    toPath:destPath
             withParentRev:nil
                  fromPath:localFilePath];
    
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
        
        // Remove from Dropbox
        NSString *filePath=[NSString stringWithFormat:@"/%@",_objects[indexPath.row]];
        [restClient deletePath:filePath];
        
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
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - DBRestClientDelegate Methods

- (void) restClient:(DBRestClient *)client loadedMetadata:(DBMetadata *)metadata {
    
    if(metadata.isDirectory)
    {
        // Create _objects if necessary
        if(_objects==nil)
        {
            _objects=[NSMutableArray new];
        }
        else
        {
            [_objects removeAllObjects];
        }
        
        for(DBMetadata *data in metadata.contents)
        {
            NSLog(@"Filename: %@",data.filename);
            [_objects addObject:data.filename];
        }
        
        [self.tableView reloadData];
    }
    
}

- (void) restClient:(DBRestClient *)client loadMetadataFailedWithError:(NSError *)error {
    
}

- (void) restClient:(DBRestClient *)client uploadedFile:(NSString *)destPath from:(NSString *)srcPath metadata:(DBMetadata *)metadata {
    
    NSString *message=[NSString stringWithFormat:@"%@ ==> %@",srcPath,destPath];
    
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
    
    [self reloadList];
    
}

- (void) restClient:(DBRestClient *)client uploadFileFailedWithError:(NSError *)error {
    
}

- (void) restClient:(DBRestClient *)client deletedPath:(NSString *)path {
    NSLog(@"Delete Successfully.(%@)",path);
}

- (void) restClient:(DBRestClient *)client deletePathFailedWithError:(NSError *)error {
    NSLog(@"Delete Fail.(%@)",[error description]);
}



@end








