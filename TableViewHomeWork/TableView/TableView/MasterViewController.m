//
//  MasterViewController.m
//  TableView
//
//  Created by BigkongWang on 2014/9/24.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"
static NSString * const kJSON = @"http://localhost/selectFruits.php";
@interface MasterViewController () {
    NSMutableArray *_objects;
    /*TableView資料以Array傳值
    NSMutableArray *fruitNames;
    NSMutableArray *fruitImages;
    NSMutableArray *fruitEnglishNames;
    NSMutableArray *fruitSmallImages;
    */
    
    /*TableView資料以Dictionary傳值
    NSMutableArray *fruitDataArray;
    */
    
    //TableView資料從Parse網站讀取JSON資料
    NSMutableArray *jsonArray;
    NSArray *placeHolder;
}
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //載入時先用內建Indicator轉圈圈，並設定停止後自動隱藏
    [_myIndicator setHidesWhenStopped:YES];
    [_myIndicator startAnimating];
    
    //在資料載入完成前，tableViewCell顯示之資料
    placeHolder=@[@"nonimage.png",@"Data is loading...",@"Pleas wait!"];
    [self.tableView reloadData];
    
    //查詢parse網站資料
    PFQuery *query = [PFQuery queryWithClassName:@"fruits"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error!=nil) {
            //如果讀取資料發生錯誤會執行這裡
        }else{
            //因為jsonArray為mutableArray，故將NSArray的objects物件以mutable格式傳給jsonArray
            jsonArray=[objects mutableCopy];
            [self.tableView reloadData];
            //資料載入完成後停止Indicator轉圈圈
            [_myIndicator stopAnimating];
        }
    }];
    NSLog(@"query4");
    /*TableView資料以Array傳值
    fruitNames=[[NSMutableArray alloc]initWithObjects:@"香蕉",
                 @"番茄",@"芭樂",nil];
    fruitImages=[[NSMutableArray alloc]initWithObjects:@"banana.png",
                 @"tomato.png",@"guava.png",nil];
    fruitSmallImages=[[NSMutableArray alloc]initWithObjects:@"banana40x40.png",@"tomato40x40.png",@"guava40x40.png",nil];
    fruitEnglishNames=[[NSMutableArray alloc]initWithObjects:@"Banana",
                 @"Tomato",@"Guava",nil];
    */
    
    /*TableView資料以Dictionary傳值
     fruitDataArray=[[NSMutableArray alloc]initWithObjects:
     @{@"Title":@"香蕉",@"EnglishName":@"Banana",@"BigImageFileName":@"banana.png",@"IconImageFileName":@"banana40x40.png"},
     @{@"Title":@"番茄",@"EnglishName":@"Tomato",@"BigImageFileName":@"tomato.png",@"IconImageFileName":@"tomato40x40.png"},
     @{@"Title":@"芭樂",@"EnglishName":@"Guava",@"BigImageFileName":@"guava.png",@"IconImageFileName":@"guava40x40.png"},
     nil];
     */
    
    //TableView資料從PHP網站讀取JSON資料傳值
    /*
    NSURL *url = [NSURL URLWithString:kJSON];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    jsonArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    //UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"同步資料下載" message:@"下載完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    //[alert show];
      */
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
   
    
}
-(void)getPareImageWithData{
    
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
    [_objects insertObject:[NSDate date] atIndex:0];
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
    //return self.fruitNames.count;
    //return fruitNames.count;
    //return [fruitNames count];
    //return [fruitDataArray count];
    if (jsonArray!=nil) {
        return [jsonArray count];
    }else{
        return 50;
    }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    /*TableView資料以Array傳值
    cell.detailTextLabel.text=[fruitEnglishNames objectAtIndex:indexPath.row];
    [cell.imageView setImage:[UIImage imageNamed:[fruitSmallImages objectAtIndex:indexPath.row]]];
    cell.textLabel.text=[fruitNames objectAtIndex:indexPath.row];
    */
    
    /*TableView資料以Dictionary傳值
    cell.detailTextLabel.text=[[fruitDataArray objectAtIndex:indexPath.row]objectForKey:@"EnglishName"];
    [cell.imageView setImage:[UIImage imageNamed:[[fruitDataArray objectAtIndex:indexPath.row]objectForKey:@"IconImageFileName"]]];
    cell.textLabel.text=[[fruitDataArray objectAtIndex:indexPath.row]objectForKey:@"Title"];
    */
    
    //TableView資料從PHP網站讀取JSON資料傳值
    /*
    cell.detailTextLabel.text=[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"EnglishName"];
    [cell.imageView setImage:[UIImage imageNamed:[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"IconImageFileName"]]];
    cell.textLabel.text=[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"Title"];
    */
    if (jsonArray!=nil) {
        //從parse網站讀入資料後，執行這裡
        cell.detailTextLabel.text=[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"EnglishName"];
        cell.textLabel.text=[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"Title"];
        [cell.imageView setImage:[UIImage imageWithData:[[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"IconImage"]getData]]];
    } else {
        //程式剛啟動時，先執行這裡
        cell.detailTextLabel.text=[placeHolder objectAtIndex:2];
        cell.textLabel.text=[placeHolder objectAtIndex:1];
        [cell.imageView setImage:[UIImage imageNamed:[placeHolder objectAtIndex:0]]];
    }


    
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
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        /*TableView資料以Array傳值
         [[segue destinationViewController] setFruitImageName:[fruitImages objectAtIndex:indexPath.row]];
        [[segue destinationViewController] setFruitName:[fruitNames objectAtIndex:indexPath.row]];
        */
        
        
        /*TableView資料以Dictionary傳值
        [[segue destinationViewController] setFruitImageName:[[fruitDataArray objectAtIndex:indexPath.row]objectForKey:@"BigImageFileName"]];
        [[segue destinationViewController] setFruitName:[[fruitDataArray objectAtIndex:indexPath.row]objectForKey:@"Title"]];
         */
        /*
        //TableView資料從PHP網站讀取JSON資料傳值
        [[segue destinationViewController] setFruitImageName:[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"BigImageFileName"]];
        [[segue destinationViewController] setFruitName:[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"Title"]];
         */
        
        //將水果圖及中文名傳給DetailViewController
        [[segue destinationViewController] setFruitImage:[UIImage imageWithData:[[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"Image"]getData]]];
        [[segue destinationViewController] setFruitName:[[jsonArray objectAtIndex:indexPath.row]objectForKey:@"Title"]];
    }
}

@end
