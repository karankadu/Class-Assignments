//
//  multiplicationtableViewController.m
//  MultiplicationTable
//
//  Created by apple on 25/07/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import "multiplicationtableViewController.h"

@interface multiplicationtableViewController ()

@end

@implementation multiplicationtableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _mTablearray=[[NSMutableArray alloc]init];

    [self.tbl1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return _mTablearray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text=[_mTablearray objectAtIndex:indexPath.row];
    // Configure the cell...
    
return cell;
    
    
}




- (IBAction)btnclick:(id)sender
{
    [_mTablearray removeAllObjects];
    
    int number= [_tf2.text intValue];
    int no2=[_tf1.text intValue];
    
    
    for (int i=1; i<=number; i++)
    {
        
     
        NSString * s4=[[NSString alloc]init];
        s4=[NSString  stringWithFormat:@"%d * %d=%d",no2,i,no2*i];
        
     [_mTablearray addObject:s4];
        
        
    }
  
    [self.tbl1 reloadData];
    
 
   
}




@end
