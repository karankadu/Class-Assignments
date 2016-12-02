//
//  MissedCall-TableViewController.m
//  callLogManager
//
//  Created by Karan on 24/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

#import "MissedCall-TableViewController.h"
#import "customTableViewCell.h"
#import "userInfo.h"

@interface MissedCall_TableViewController ()

@end

@implementation MissedCall_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userInfo *u1=[[userInfo alloc]init];
    u1.username=@"Steve Jobs";
    u1.userImage=@"user1_70p";
    u1.calldate=@"Today 11.00 AM";
    u1.callimage=@"missedcall";
    u1.calltiming=@" ";
    
    userInfo *u2=[[userInfo alloc]init];
    u2.username=@"Deepika";
    u2.userImage=@"user2_70p";
    u2.calldate=@"Today 1.00 PM";
    u2.callimage=@"missedcall";
    u2.calltiming=@" ";
    
    userInfo *u3=[[userInfo alloc]init];
    u3.username=@"8888888888";
    u3.userImage=@"nophoto";
    u3.calldate=@"Yesterday 5.15 PM";
    u3.callimage=@"missedcall";
    u3.calltiming=@" ";
    
    
    userInfo *u4=[[userInfo alloc]init];
    u4.username=@"Modi";
    u4.userImage=@"user3_70p";
    u4.calldate=@"Yesterday 10.30 AM";
    u4.callimage=@"missedcall";
    u4.calltiming=@" ";
    
    
    _missedCallArray=[[NSMutableArray alloc]initWithObjects:u4,u3,u2,u1,nil];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"customTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    _swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    _swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:_swipeRight];
    _swipeRight.delegate = self;
    
}

-(void) swipeRight:(UISwipeGestureRecognizer *) recognizer {
    //if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
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
    return _missedCallArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    
     customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    userInfo *tempUser=[_missedCallArray objectAtIndex:indexPath.row];
    
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
