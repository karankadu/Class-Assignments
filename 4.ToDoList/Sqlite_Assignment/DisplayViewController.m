//
//  DisplayViewController.m
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import "DisplayViewController.h"
#import <Sqlite3.h>
#import "EditViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController

- (void)viewDidLoad {
    self.navigationItem.title=@"DISPLAY RECORD";
    
    [super viewDidLoad];
    [self readdata];
}


- (void) readdata {
    
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    sqlite3_stmt *mystmt;
    sqlite3 *db;
    
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
      NSString *string = [NSString stringWithFormat:@"select * from user where userid=%ld",(long)_tempindex];
        
        const char *query = [string UTF8String];
        
        if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK){
            
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
               // int empid = sqlite3_column_int(mystmt,0);
                NSString *name = [NSString stringWithFormat:@"%s", sqlite3_column_text(mystmt,1)];
                NSString *password = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,2)];
                NSString *email = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,3)];
                NSString *city = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,4)];
                NSString *phone = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,5)];
              // unsigned long int phone = sqlite3_column_int(mystmt,5);
             //   NSLog(@" %d   %@      %@    %@      %@    %@",empid,name,password,email,city,phone);
                
                _name.text=name;
                _password.text=password;
                _email.text=email;
                _city.text=city;
                _phone.text=phone;
                
                
            }
            
        }
        else {
            
            NSLog(@"fail to executed query");
        }
        
        
    }
    else {
        
        NSLog(@"fail to open database");
    }
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"dvctoevc"]) {
        
        
        
        EditViewController *evc = [segue destinationViewController];
        
        evc.rowid = _tempindex;
        
        
        
    }
    
    
    
    
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

- (IBAction)edit:(UIButton *)sender {
}
@end
