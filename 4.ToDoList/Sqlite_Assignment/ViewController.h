//
//  ViewController.h
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *name;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *phone;


- (IBAction)save:(UIButton *)sender;
//- (IBAction)readdata:(UIButton *)sender;


@end

