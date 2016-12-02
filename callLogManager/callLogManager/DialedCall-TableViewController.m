//
//  DialedCall-TableViewController.m
//  callLogManager
//
//  Created by Karan on 24/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "DialedCall-TableViewController.h"
#import "customTableViewCell.h"
#import "userInfo.h"

@interface DialedCall_TableViewController ()

@end

@implementation DialedCall_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    userInfo *u1=[[userInfo alloc]init];
    u1.username=@"Steve Jobs";
    u1.userImage=@"user1_70p";
    u1.calldate=@"Today 11.00 AM";
    u1.callimage=@"dialedcall";
    u1.calltiming=@"12m 20s";
    
    userInfo *u2=[[userInfo alloc]init];
    u2.username=@"Deepika";
    u2.userImage=@"user2_70p";
    u2.calldate=@"Today 1.00 PM";
    u2.callimage=@"dialedcall";
    u2.calltiming=@"20m 0s";
    
    userInfo *u3=[[userInfo alloc]init];
    u3.username=@"8888888888";
    u3.userImage=@"nophoto";
    u3.calldate=@"Yesterday 5.15 PM";
    u3.callimage=@"dialedcall";
    u3.calltiming=@"5m 10s";
    
    
    userInfo *u4=[[userInfo alloc]init];
    u4.username=@"Modi";
    u4.userImage=@"user3_70p";
    u4.calldate=@"Yesterday 10.30 AM";
    u4.callimage=@"dialedcall";
    u4.calltiming=@"15m 30s";
    
    
    _dialedCallArray=[[NSMutableArray alloc]initWithObjects:u3,u4,u1,u2,nil];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"customTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    _swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    _swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:_swipeLeft];
    _swipeLeft.delegate = self;
    
    _swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    _swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:_swipeRight];
    _swipeRight.delegate = self;


}

-(void) swipeLeft:(UISwipeGestureRecognizer *) recognizer {
    //if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    int index=self.tabBarController.selectedIndex;
    self.tabBarController.selectedIndex=index+1;
       // NSLog(@"swipe left");
    
}

-(void) swipeRight:(UISwipeGestureRecognizer *) recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    { int index=self.tabBarController.selectedIndex;
        self.tabBarController.selectedIndex=index-1;
    }
    // NSLog(@"swipe Right");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _dialedCallArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
     customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    

    userInfo *tempUser=[_dialedCallArray objectAtIndex:indexPath.row];
    
    cell.userImageView.image=[UIImage imageNamed:tempUser.userImage];
    cell.userNamelbl.text=tempUser.username;
    cell.datelbl.text=tempUser.calldate;
    cell.callImageView.image=[UIImage imageNamed:tempUser.callimage];
    cell.callTiminglbl.text=tempUser.calltiming;

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
