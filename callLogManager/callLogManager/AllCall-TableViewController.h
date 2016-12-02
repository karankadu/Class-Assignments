//
//  AllCall-TableViewController.h
//  callLogManager
//
//  Created by Karan on 24/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllCall_TableViewController : UITableViewController<UIGestureRecognizerDelegate>

@property(nonatomic,retain)NSMutableArray *allCallArray;

@property(nonatomic,retain)UISwipeGestureRecognizer *swipeLeft;

@end
