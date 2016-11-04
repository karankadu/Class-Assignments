//
//  ViewController.m
//  StopTimer
//
//  Created by Felix-ITS 012 on 08/08/16.
//  Copyright © 2016 Felix-ITS 012. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _lbl.text=@"00:00:00";
    running=false;
    
    
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

- (IBAction)reset:(id)sender {
    
    _lbl.text=@"00:00:00";
    running=false;
}

- (IBAction)start:(id)sender {
    
    if(running==false)
    {
        running=true;
        startTime=[NSDate timeIntervalSinceReferenceDate];
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        [self updateTime];
        
    }
    else
    {
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        //running=false;
      //  [self updateTime];
        running=false;
    }
}

-(void)updateTime
{
    if(running==false)return;
    
    NSTimeInterval currentTime=[NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval elapsed=currentTime-startTime;
    
    
    int mins=(int)(elapsed/60.0);
    elapsed -= mins*60;
    int secs=(int)(elapsed);
    elapsed-=secs;
    int fraction=elapsed*10.0;

    _lbl.text=[NSString stringWithFormat:@"%u:%02u.%02u",mins,secs,fraction];
    
    [self performSelector:@selector(updateTime) withObject:self afterDelay:0.1];
    

}
@end
