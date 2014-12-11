//
//  MasterViewController.m
//  HelloiCloud
//
//  Created by Kent Liu on 2014/5/16.
//  Copyright (c) 2014年 Kent Liu. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
    NSURL *ubiq;
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
    
    // Check if iCloud is available
    id identityToken = [[NSFileManager defaultManager]
                        ubiquityIdentityToken];
    if (identityToken) {
        NSLog(@"iCloud access Exist,identityToken: %@", [identityToken description]);
        
    } else {
        NSLog(@"No iCloud access");
    }
    
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    if(identityToken!=nil)
    {
        ubiq = [[NSFileManager defaultManager]
                URLForUbiquityContainerIdentifier:nil];
        
        ubiq = [ubiq URLByAppendingPathComponent:@"Documents"];
        
//        ubiq = [[NSFileManager defaultManager]
//        URLForUbiquityContainerIdentifier:@"EV6JQB3PQH.com.kent.icloud.test2"];
        
        // Load the content list from ubiq
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSArray *directoryContent = [fileManager contentsOfDirectoryAtPath:ubiq.path error:nil];
        
        for(NSString *tmpFileName in directoryContent)
        {
            NSLog(@"%@",tmpFileName);
            [_objects addObject:tmpFileName];
        }
        
//        [self.tableView reloadData];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    if(ubiq==nil)
    {
        NSLog(@"iCloud is inaccessable.");
        return;
    }
    
    // Add Files to iCloud
    NSURL *sourceURL=[[NSBundle mainBundle] URLForResource:@"Jobs"withExtension:@"png"];
    
    NSString *fileName=[NSString stringWithFormat:@"%@.png",[[NSDate date] description]];
    
    NSURL *targetURL=[ubiq URLByAppendingPathComponent:fileName];
    
    [[NSFileManager defaultManager] copyItemAtURL:sourceURL toURL:targetURL error:nil];
    
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
    if(ubiq==nil)
        return NO;
    else
        return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Remove from iCloud
        
        NSURL *fileURL=[ubiq URLByAppendingPathComponent:_objects[indexPath.row]];
        
        [[NSFileManager defaultManager] removeItemAtURL:fileURL error:nil];
        
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

- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if(ubiq==nil)
        return NO;
    else
        return YES;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = _objects[indexPath.row];
        
        NSURL *fileURL=[ubiq URLByAppendingPathComponent:_objects[indexPath.row]];
        
        [[segue destinationViewController] setDetailItem:fileURL];
    }
}

@end
