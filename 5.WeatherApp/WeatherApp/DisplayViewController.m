//
//  DisplayViewController.m
//  WeatherApp
//
//  Created by Karan on 12/09/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "DisplayViewController.h"


@interface DisplayViewController ()

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    _mydata=[[NSMutableData alloc]init];
    
  //  NSString *path=@"http://api.openweathermap.org/data/2.5/weather?q=Pune,IN&appid=e376686a6f59ecc9d06a38b21236da3e";
    
    NSString *path=_selectedurl;
    
   // NSLog(@"%@",_selectedurl);
    
    NSURL *url=[NSURL URLWithString:path];
    
    NSMutableURLRequest  *req=[NSMutableURLRequest requestWithURL:url];
    req.HTTPMethod=@"GET";
    
    [NSURLConnection connectionWithRequest:req delegate:self];

    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    [_mydata setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    
    [_mydata appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:_mydata options:NSJSONReadingAllowFragments error:nil];
    
        NSDictionary *dictionary=[dic objectForKey:@"main"];
    
        NSString *tempstr=[[dictionary objectForKey:@"temp"]description];
        NSString *pressurestr=[[dictionary objectForKey:@"pressure"]description];
        NSString *min_tempstr=[[dictionary objectForKey:@"temp_min"]description];
        NSString *max_tempstr=[[dictionary objectForKey:@"temp_max"]description];

            _templbl.text=tempstr;
            _mintemplbl.text=min_tempstr;
            _maxtemplbl.text=max_tempstr;
            _pressurelbl.text=pressurestr;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
