//
//  DisplayViewController.h
//  Sqlite_Assignment
//
//  Created by Eliza Khan on 17/8/16.
//  Copyright © 2016 Asif Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController

@property NSInteger tempindex;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *password;

@property (weak, nonatomic) IBOutlet UILabel *email;

@property (weak, nonatomic) IBOutlet UILabel *city;

@property (weak, nonatomic) IBOutlet UILabel *phone;

- (IBAction)edit:(UIButton *)sender;

@end
