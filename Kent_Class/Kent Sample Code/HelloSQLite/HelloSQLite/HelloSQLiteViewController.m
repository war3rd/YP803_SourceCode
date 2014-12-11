//
//  HelloSQLiteViewController.m
//  HelloSQLite
//
//  Created by Liu Kent on 2011/3/17.
//  Copyright 2011年 SoftArt Laboratory. All rights reserved.
//

#import "HelloSQLiteViewController.h"
#import <sqlite3.h>

@interface HelloSQLiteViewController (Private)

- (void) doSQLiteWork;

@end

@implementation HelloSQLiteViewController

- (void)dealloc
{
    [theImageView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self doSQLiteWork];

}


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

- (void) doSQLiteWork {

    // Prepare the Path and File Name of DB File
    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *dbPathFileName = [documentsPath stringByAppendingPathComponent:@"sample.db"];    
    
    BOOL bFirstTime=([[NSFileManager defaultManager] fileExistsAtPath:dbPathFileName]==NO);
    
    sqlite3 *dbHandle;
    char *sqlite_exec_result;
    
    if ( sqlite3_open( [dbPathFileName UTF8String] , &dbHandle ) == SQLITE_OK ) {

        // Create The Table at the first time running
        if (bFirstTime) {
            if( sqlite3_exec( dbHandle , "CREATE TABLE IF NOT EXISTS sample_table(uid integer primary key autoincrement,firstname text,lastname text,adddatetime text,dataimage blob);" , NULL , NULL , &sqlite_exec_result ) != SQLITE_OK )
            {
                NSLog( @"Error: %s" , sqlite_exec_result );
                sqlite3_free(sqlite_exec_result); 
            }
        }

        // Insert One Entry
        sqlite3_stmt *statement;         
        if ( sqlite3_prepare_v2( dbHandle ,  "INSERT INTO sample_table (firstname,lastname,adddatetime,dataimage) VALUES(?,?,?,?);" , -1 , &statement , nil ) == SQLITE_OK ) 
        {
            sqlite3_bind_text(statement, 1, [@"Peter" UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(statement, 2, [@"Lee" UTF8String], -1, SQLITE_TRANSIENT);      
            sqlite3_bind_text(statement, 3, [[[NSDate date] description] UTF8String], -1, SQLITE_TRANSIENT);   
            
            // Load from bundle
            NSString *imageDataFilePathName=[[NSBundle mainBundle] pathForResource:@"home" ofType:@"png"];
            NSData *imgData=[NSData dataWithContentsOfFile:imageDataFilePathName];
            
            sqlite3_bind_blob(statement, 4, [imgData bytes], [imgData length], NULL);
            
            if(sqlite3_step(statement)!=SQLITE_DONE)
            {
                NSLog(@"Error while updating. '%s'", sqlite3_errmsg(dbHandle));                
            }
            
            // Release the result statement
            sqlite3_finalize(statement);            
        }  
/*        
        sprintf(sqlstatementTmp,"INSERT INTO sample_table (firstname,lastname,adddatetime) VALUES('Peter','Lee','%s');",[[[NSDate date] description] UTF8String]);
        
        if( sqlite3_exec( dbHandle , sqlstatementTmp , NULL , NULL , &sqlite_exec_result ) != SQLITE_OK )
        {
            NSLog( @"Error: %s" , sqlite_exec_result );
            sqlite3_free(sqlite_exec_result);                 
        }
*/        
          
        // Get the Count of Query Result 
        if ( sqlite3_prepare_v2( dbHandle ,  "SELECT COUNT(*) FROM sample_table;" , -1 , &statement , nil ) == SQLITE_OK ) 
        {
            if(sqlite3_step(statement) == SQLITE_ROW){
                int totalCount = sqlite3_column_int(statement, 0);
                
                NSLog(@"Total Entries: %d",totalCount);
            }
            // Release the result statement
            sqlite3_finalize(statement);            
        }        
        
        
        // Query the result
     
        if ( sqlite3_prepare_v2( dbHandle ,  "SELECT * FROM sample_table;" , -1 , &statement , nil ) == SQLITE_OK ) 
        {
            
            while(sqlite3_step(statement) == SQLITE_ROW){
                int uid = sqlite3_column_int(statement, 0);
                NSString *firstName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                NSString *lastName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                NSString *addDateTime = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];   
                NSData *imageData = [[NSData alloc] initWithBytes:sqlite3_column_blob(statement, 4) 
                                                      length:sqlite3_column_bytes(statement, 4)];
                
                [theImageView setImage:[UIImage imageWithData:imageData]];
                
                NSLog(@"id: %i, first name: %@, last name: %@, add date time: %@,BLOB data length: %d", uid, firstName, lastName,addDateTime,[imageData length]);
            }
            
            // Release the result statement
            sqlite3_finalize(statement);            
        }
        


        
    } else {
        NSLog( @"Fail to open database file: %@" , dbPathFileName);
    }
    
    
    sqlite3_close( dbHandle );    
 
}

@end
