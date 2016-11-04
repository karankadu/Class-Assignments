//
//  TableViewController.m
//  WeatherApp
//
//  Created by Karan on 14/09/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "TableViewController.h"
#import "DisplayViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cityarray=[[NSMutableArray alloc]initWithObjects:@"Pune",@"Mumbai",@"Nagpur",@"Lonavala",@"Aurangabad",@"Sangli",@"Kolhapur",@"Jalgaon",@"Thane",@"Solapur", nil];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    _tempurl=[[NSString alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _cityarray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text=[_cityarray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row==0)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Pune,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e";
        
    }
    
    else if (indexPath.row==1)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Mumbai,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==2)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Nagpur,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==3)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Lonavala,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==4)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Aurangabad,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==5)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Sangli,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==6)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Kolhapur,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==7)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Jalgaon,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else if (indexPath.row==8)
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Thane,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e"; }
    
    else
    {
        _tempurl=@"http://api.openweathermap.org/data/2.5/weather?q=Solapur,IN&units=metric&appid=e376686a6f59ecc9d06a38b21236da3e";
    
    }
    
    [self performSegueWithIdentifier:@"tabletodisplay" sender:self];


}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    DisplayViewController *dvc=[segue destinationViewController];
    
   // NSLog(@"Tempurl=== %@",_tempurl);
    
    dvc.selectedurl=_tempurl;
    
}


@end
