//
//  ViewController.h
//  StopTimer
//
//  Created by Felix-ITS 012 on 08/08/16.
//  Copyright © 2016 Felix-ITS 012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    bool running;
    
    NSTimeInterval startTime;
    

}


@property (weak, nonatomic) IBOutlet UILabel *lbl;
- (IBAction)reset:(id)sender;

- (IBAction)start:(id)sender;



@end
