//
//  customTableViewCell.h
//  callLogManager
//
//  Created by Karan on 24/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@property (weak, nonatomic) IBOutlet UILabel *userNamelbl;


@property (weak, nonatomic) IBOutlet UILabel *datelbl;

@property (weak, nonatomic) IBOutlet UIImageView *callImageView;

@property (weak, nonatomic) IBOutlet UILabel *callTiminglbl;
@end
