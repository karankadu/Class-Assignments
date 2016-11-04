//
//  TableViewController.h
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *table;

@property (retain,nonatomic) NSMutableArray *array;

@property (nonatomic,retain) UIRefreshControl *refreshcontrol;

@end
