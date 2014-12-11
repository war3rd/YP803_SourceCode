//
//  MasterViewController.m
//  HelloSandboxAndFileManagement
//
//  Created by Kent Liu on 2014/5/12.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#define STRINGKEY       @"StringKey"
#define CREATEDATEKEY   @"CreateDateKey"

@interface MasterViewController () {
    NSMutableArray *_objects;
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
    
    // Get Home Directory
    
    NSLog(@"Home: %@",NSHomeDirectory());
    
    // Get File List of Documents Folder
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *directoryContent = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:NULL];
    
    for(NSString *tmpFileName in directoryContent)
    {
        NSLog(@"%@",tmpFileName);
        [_objects addObject:tmpFileName];
        
        //
        NSString *fullFilePath=[documentsDirectory stringByAppendingPathComponent:tmpFileName];
        
        NSDictionary *attributes=[fileManager attributesOfItemAtPath:fullFilePath error:nil];
        
        NSLog(@"Attributes :%@",[attributes description]);
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary*) createDataObject {
    
    NSDictionary *result=
  @{STRINGKEY: @"I am a String.",
    CREATEDATEKEY: [NSDate date]};
    
    return result;
}

- (void)insertNewObject:(id)sender
{

    
    // Try to save the file to Documents
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSDictionary *newObject=[self createDataObject];
    NSString *fileName=[NSString stringWithFormat:@"%@.plist",newObject[CREATEDATEKEY]];
    
    NSString *fullFilePathName=[documentsDirectory stringByAppendingPathComponent:fileName];
    
    [newObject writeToFile:fullFilePathName atomically:YES];
    
    // Keep Filename in _objects
    [_objects insertObject:fileName atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
        
        // Delete file from Documents
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *fullFilePathName=[documentsDirectory stringByAppendingPathComponent:_objects[indexPath.row]];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if([fileManager fileExistsAtPath:fullFilePathName])
        {
            [[NSFileManager defaultManager] removeItemAtPath:fullFilePathName error:nil];
        }
        
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
        id object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
