//
//  ViewController.m
//  GetLottoSamples
//
//  Created by BigkongWang on 2014/9/22.
//  Copyright (c) 2014年 Max. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Reachability.h"
static NSString * const kJSON = @"http://dl.dropboxusercontent.com/u/4223444/twLoto.json";
static NSString * const kXML = @"http://dl.dropboxusercontent.com/u/4223444/twLoto.xml";
@interface ViewController ()<NSURLConnectionDataDelegate>{
    NSArray *arrayDatas;
    NSMutableData *datas;
}

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    datas= [NSMutableData data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction
- (IBAction)JSONSerializationSyncAction:(id)sender {
    Reachability *reach= [Reachability reachabilityWithHostName:@"dl.dropboxusercontent.com"];
    NetworkStatus netStatus=[reach currentReachabilityStatus];
    if(netStatus!=NotReachable){
        //JSON Sycn
        NSURL *url = [NSURL URLWithString:kJSON];
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        arrayDatas=[dic objectForKey:@"catalog"];
        NSLog(@"%@",arrayDatas);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"同步資料下載" message:@"下載完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }else  {
        //Can not connect
        NSLog(@"%@",arrayDatas);
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"連線有誤" message:@"網路無法連線，請稍後再試!!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
    
}
- (IBAction)JSONSerializationAsyncActon:(id)sender {
    NSURL *url = [NSURL URLWithString:kJSON];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    

}
- (IBAction)JSONSerializationAsyncBlockAction:(id)sender {
    NSURL *url = [NSURL URLWithString:kJSON];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSOperationQueue *queue= [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([data length]>0 && connectionError==nil) {
            NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            arrayDatas=[dic objectForKey:@"catalog"];
            NSLog(@"JSON Async Block:\n%@",arrayDatas);
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"非同步BLOCK資料下載" message:@"下載完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            });
        } else if([data length]==0 && connectionError==nil) {
            
        } else if(connectionError!=nil){
            
        }
    }];
}
- (IBAction)AFNetworkingJSONAction:(id)sender {
    NSURL *url = [NSURL URLWithString:kJSON];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation= [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer=[AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/plain"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //
       
        arrayDatas=[responseObject objectForKey:@"catalog"];
        NSLog(@"JSON AFNetworking:\n%@", arrayDatas);
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AFNetworking資料下載" message:@"下載完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        });
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"AFNetworking資料下載" message:@"下載失敗" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            });
        }];
    [operation start];
}

#pragma mark - NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [datas setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [datas appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [datas setLength:0];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:datas options:NSJSONReadingAllowFragments error:nil];
    arrayDatas=[dic objectForKey:@"catalog"];
    NSLog(@"%@",arrayDatas);
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"非同步資料下載" message:@"下載完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];}


@end
