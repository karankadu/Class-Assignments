//
//  ViewController.m
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.navigationItem.title=@"ADD RECORD";
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(UIButton *)sender {
    
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    
    sqlite3 *db;
    
    
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
        
        NSString *string = [NSString stringWithFormat:@"insert into user values(null,'%@','%@','%@','%@','%@')",self.name.text,self.password.text,self.email.text,self.city.text,self.phone.text];
    
        const char *query = [string UTF8String];
        

     //   const char *query = "insert into user values('Asif','Secret','akpixels@gmail.com','Pune','1234')";
        
        
        if (sqlite3_exec(db,query,NULL,NULL,NULL)==SQLITE_OK) {
            
            NSLog(@"data inserted");
        }
        
        else
        {
            NSLog(@"fail to insert record");
            
        }
        
    }
    else {
        
        NSLog(@"fail to open database");
    }
    sqlite3_close(db);
    
}


/*
- (IBAction)readdata:(UIButton *)sender {
    
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    sqlite3_stmt *mystmt;
    sqlite3 *db;
    
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
        const char *query = "select * from user";
        
        if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK){
            
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
               // int empid = sqlite3_column_int(mystmt,0);
                NSString *name = [NSString stringWithFormat:@"%s", sqlite3_column_text(mystmt,0)];
                NSString *password = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,1)];
                NSString *email = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,2)];
                NSString *city = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,3)];
                NSString *phone = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,4)];
                
               // unsigned long int phone = sqlite3_column_int(mystmt,4);
                NSLog(@"    %@      %@    %@      %@    %@",name,password,email,city,phone);
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


*/





@end

