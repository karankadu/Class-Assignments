//
//  EditViewController.m
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import "EditViewController.h"
#import "Sqlite3.h"

@interface EditViewController ()

@end

@implementation EditViewController


- (void)viewDidLoad {
    self.navigationItem.title=@"EDIT RECORD";
    
    [super viewDidLoad];
    [self readdata];
    
}


- (void) readdata {
    
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    sqlite3_stmt *mystmt;
    sqlite3 *db;
    
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
        NSString *string = [NSString stringWithFormat:@"select * from user where userid=%ld",(long)_rowid];
        
        const char *query = [string UTF8String];
        // const char *query = "select * from user where rowid=1";
        
        if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK){
            
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
                // int empid = sqlite3_column_int(mystmt,0);
                NSString *name = [NSString stringWithFormat:@"%s", sqlite3_column_text(mystmt,1)];
                NSString *password = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,2)];
                NSString *email = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,3)];
                NSString *city = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,4)];
                NSString *phone = [NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,5)];
              //  unsigned long int phone = sqlite3_column_int(mystmt,5);
                NSLog(@"    %@      %@    %@      %@    %@",name,password,email,city,phone);
                
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

- (IBAction)update:(UIButton *)sender {
    
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    
    sqlite3 *db;
    
    
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
        
        NSString *string = [NSString stringWithFormat:@"update user SET username='%@',userpassword='%@',useremail='%@',usercity='%@',userphone='%@' WHERE userid=%ld",_name.text,_password.text,_email.text,_city.text,_phone.text,_rowid];
       // NSLog(@"%@",string);
        
        const char *query = [string UTF8String];
        
        
        //   const char *query = "insert into user values('Asif','Secret','akpixels@gmail.com','Pune','1234')";
        
        
        if (sqlite3_exec(db,query,NULL,NULL,NULL)==SQLITE_OK) {
            
            NSLog(@"data updated");
        }
        
        else
        {
            NSLog(@"failed to update record");
            
        }
        
    }
    else {
        
        NSLog(@"fail to open database");
    }
    sqlite3_close(db);
    
}
@end
