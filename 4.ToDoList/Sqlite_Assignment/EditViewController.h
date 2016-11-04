//
//  EditViewController.h
//  Sqlite_Assignment
//

//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *city;
@property (weak, nonatomic) IBOutlet UITextField *phone;
- (IBAction)update:(UIButton *)sender;
@property NSInteger rowid,updateid;
@end
