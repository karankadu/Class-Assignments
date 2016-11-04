//
//  ViewController.h
//  7. Tic Tac Toe
//
//  Created by Student-006 on 16/02/16.
//  Copyright © 2016 Student-006. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentSymbolFlag,i,j,k;
    NSMutableArray * currentState;
    NSArray * winningCombination;
    UIButton * button;
    BOOL winnerFound, gameOver;
    UIAlertController * winner;
    UIAlertAction * ok, * replay;
    IBOutlet UISegmentedControl * Player;
}
- (IBAction)ButtonPressed:(UIButton *)sender;


@end

