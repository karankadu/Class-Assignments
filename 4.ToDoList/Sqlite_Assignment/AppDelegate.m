//
//  AppDelegate.m
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //call createdatabase function to create database
    
    [self createdatabase];
    
    return YES;
}


//define createdatabase function

-(void) createdatabase {
    
    
    //get the directory path for document directory
    NSArray *dir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //create database userdb.sqlite
    NSString *dbpath = [NSString stringWithFormat:@"%@/userdb.sqlite", [dir lastObject]];
    
    //path and filename of Sqlite database
    NSLog(@"%@", dbpath);
    
   
    
    //Create NSFileManager object called manager to check if database is already present or not
    NSFileManager *manager = [[NSFileManager alloc]init];
    if ([manager fileExistsAtPath:dbpath]) {
        NSLog(@"database already present");
        return;
    }
    
    
    //create copy of userdb.sqlite database
    sqlite3 *db;
    
    
    //Open database db using command sqlite3_open(<#const char *filename#>, <#sqlite3 **ppDb#>). [dbpath UTF8String] gives const char path name to the database file. Double pointer to database db is provided by &db. If database successfully opens i.e. SQLITE_OK than proceed with further create table SQL query
   
    if (sqlite3_open ([dbpath UTF8String], &db)==SQLITE_OK) {
        
       //define the SQL query to create table and store it in const char query variable
       const char *query="create table user(userid integer PRIMARY KEY AUTOINCREMENT, username varchar(20),userpassword varchar(20),useremail varchar(20),usercity varchar(20),userphone varchar(40))";
        
        
     //   sqlite3_exec(<#sqlite3 *#>, <#const char *sql#>, <#int (*callback)(void *, int, char **, char **)#>, <#void *#>, <#char **errmsg#>)
            if (sqlite3_exec (db,query,NULL,NULL,NULL)==SQLITE_OK)
            {
            
            NSLog(@"table created successfully ");
            }
            else
            {
            NSLog(@"fail to create table");
            }
        
    }
    //else for the SQLite3_Open IF
    else
    {
        
        NSLog(@"fail to open database");
    }
    
    
    //close the db once the table is created
    sqlite3_close(db);
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
