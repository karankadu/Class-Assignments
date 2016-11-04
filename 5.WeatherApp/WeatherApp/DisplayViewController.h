//
//  DisplayViewController.h
//  WeatherApp
//
//  Created by Karan on 12/09/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController

@property(nonatomic,retain)NSMutableArray *weatherdata;

@property(nonatomic,retain)NSMutableData *mydata;

@property (weak, nonatomic) IBOutlet UILabel *templbl;

@property (weak, nonatomic) IBOutlet UILabel *mintemplbl;

@property (weak, nonatomic) IBOutlet UILabel *maxtemplbl;

@property (weak, nonatomic) IBOutlet UILabel *pressurelbl;



@property(nonatomic,retain)NSString *selectedurl;





@end
