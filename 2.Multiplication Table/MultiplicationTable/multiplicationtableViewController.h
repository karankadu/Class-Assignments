//
//  multiplicationtableViewController.h
//  MultiplicationTable
//
//  Created by apple on 25/07/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface multiplicationtableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITextField *tf1;

@property (weak, nonatomic) IBOutlet UITextField *tf2;

- (IBAction)btnclick:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tbl1;
@property(nonatomic,retain) NSMutableArray * mTablearray;
@end
