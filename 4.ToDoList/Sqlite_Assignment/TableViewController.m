//
//  TableViewController.m
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import <Sqlite3.h>
#import "DisplayViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title=@"HOME";
    self.refreshControl=[[UIRefreshControl alloc]init];
    [self.tableView addSubview:self.refreshControl];
    [self.refreshControl addTarget:self action:@selector(refreshdata) forControlEvents:UIControlEventValueChanged];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
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
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text=[_array objectAtIndex:indexPath.row];
    
    return cell;


}


-(void) refreshdata {
    
    [self.refreshControl endRefreshing];
    [self.tableView reloadData];
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    _array = [[NSMutableArray alloc]init];
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    sqlite3_stmt *mystmt;
    sqlite3 *db;
    
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
        const char *query = "select * from user";
        
        if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK){
            
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
                NSString *name = [NSString stringWithFormat:@"%s", sqlite3_column_text(mystmt,1)];
                [_array addObject:name];
            }
            
        }
        else {
            
            NSLog(@"fail to executed query");
        }
        
        
    }
    else {
        
        NSLog(@"fail to open database");
    }

    [self.tableView reloadData];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self performSegueWithIdentifier:@"tvctodvc" sender:self];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"tvctodvc"]) {
        
        DisplayViewController *dvc = [segue destinationViewController];
        
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        dvc.tempindex = path.row+1;
       // NSLog(@"%ld",(long)path.row);
    }
    
    
    
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
      
        NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
        
        sqlite3 *db;
        
        
        if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
            
            
            NSString *string = [NSString stringWithFormat:@"delete from user WHERE userid=%ld",indexPath.row+1];
            NSLog(@"%@",string);
           // sqlite3_stmt *mystmt;
            const char *query = [string UTF8String];
            
            
            if (sqlite3_exec(db,query,NULL,NULL,NULL)==SQLITE_OK) {
                
                [tableView reloadData];
                NSLog(@"data updated");
            }
            
            
//            if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK){
//                
//                while (sqlite3_step(mystmt)==SQLITE_ROW) {
//                    
//                    [tableView reloadData];
//                    NSLog(@"data updated");
//                    
//                }

//           }
            
            
            else
            {
                NSLog(@"failed to update record");
                
            }
            
        }
        else {
            
            NSLog(@"fail to open database");
        }
        sqlite3_close(db);
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
