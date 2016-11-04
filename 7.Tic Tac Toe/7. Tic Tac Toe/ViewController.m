//
//  ViewController.m
//  7. Tic Tac Toe
//
//  Created by Student-006 on 16/02/16.
//  Copyright © 2016 Student-006. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    currentSymbolFlag = 1;
    currentState = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    winningCombination = [[NSArray alloc]init];
    winningCombination = @[@[@0,@1,@2],
                           @[@3,@4,@5],
                           @[@6,@7,@8],
                           @[@0,@3,@6],
                           @[@1,@4,@7],
                           @[@2,@5,@8],
                           @[@0,@4,@8],
                           @[@2,@4,@6]
                        ];
    gameOver = FALSE;
    winnerFound = FALSE;
//    Player.selectedSegmentIndex = 0;
    ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
    {
        
    }];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonPressed:(UIButton *)sender
{
    if ([[currentState objectAtIndex:sender.tag] isEqual:@0] && gameOver == FALSE)
    {
        if(currentSymbolFlag == 1)
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"cross.png"] forState:UIControlStateNormal];
            [currentState replaceObjectAtIndex:sender.tag withObject:@1];
            currentSymbolFlag = 2;
        }
        else
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"nought.png"] forState:UIControlStateNormal];
            [currentState replaceObjectAtIndex:sender.tag withObject:@2];
            currentSymbolFlag = 1;
        }
        
        for(NSArray * combination in winningCombination)
        {
            i = [[combination objectAtIndex:0]intValue];
            j = [[combination objectAtIndex:1]intValue];
            k = [[combination objectAtIndex:2]intValue];
            
            if (![[currentState objectAtIndex:i] isEqual:@0] && [[currentState objectAtIndex:i] isEqual:[currentState objectAtIndex:j]] && [[currentState objectAtIndex:j] isEqual:[currentState objectAtIndex:k]])
            {
                if (currentSymbolFlag == 1)
                {
                    winner = [UIAlertController alertControllerWithTitle:@"Winner" message:@"Player 2 is the Winner..!!" preferredStyle:UIAlertControllerStyleAlert];
                    replay = [UIAlertAction actionWithTitle:@"Replay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                              {
                                  for (int a = 0; a <=8; a++)
                                  {
                                      button = [self.view viewWithTag:a];
                                      [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
                                      [button setBackgroundColor:[UIColor clearColor]];
                                  }
                                  i=0;j=0;k=0;
                                  gameOver = FALSE;
                                  winnerFound = FALSE;
                                  currentState = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
                              }];
                    [winner addAction:ok];
                    [winner addAction:replay];
                    [self presentViewController:winner animated:YES completion:nil];
                    gameOver = TRUE;
                    winnerFound = TRUE;
                }
                else if (currentSymbolFlag == 2)
                {
                    winner = [UIAlertController alertControllerWithTitle:@"Winner" message:@"Player 1 is the Winner..!!"preferredStyle:UIAlertControllerStyleAlert];
                    replay = [UIAlertAction actionWithTitle:@"Replay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                              {
                                  for (int a = 0; a <=8; a++)
                                  {
                                      button = [self.view viewWithTag:a];
                                      [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
                                      [button setBackgroundColor:[UIColor clearColor]];
                                  }
                                  i=0;j=0;k=0;
                                  gameOver = FALSE;
                                  winnerFound = FALSE;
                                  currentState = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
                              }];
                    [winner addAction:ok];
                    [winner addAction:replay];
                    [self presentViewController:winner animated:YES completion:nil];
                    gameOver = TRUE;
                    winnerFound = TRUE;
                }
                break;
            }
        }
    }
    
    if (winnerFound == TRUE)
    {
        UIButton * winnerButton1 = (UIButton *)[self.view viewWithTag:i];
        UIButton * winnerButton2 = (UIButton *)[self.view viewWithTag:j];
        UIButton * winnerButton3 = (UIButton *)[self.view viewWithTag:k];
        
        [winnerButton1 setBackgroundColor:[UIColor redColor]];
        [winnerButton2 setBackgroundColor:[UIColor redColor]];
        [winnerButton3 setBackgroundColor:[UIColor redColor]];
    }
    
    if (![currentState containsObject:@0] && gameOver == FALSE)
    {
        winner = [UIAlertController alertControllerWithTitle:@"No Winner" message:@"Its a Tie"preferredStyle:UIAlertControllerStyleAlert];
        replay = [UIAlertAction actionWithTitle:@"Replay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                  {
                      for (int a = 0; a <=8; a++)
                      {
                          button = [self.view viewWithTag:a];
                          [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
                          [button setBackgroundColor:[UIColor clearColor]];
                      }
                      i=0;j=0;k=0;
                      gameOver = FALSE;
                      winnerFound = FALSE;
                      currentState = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
                  }];
        [winner addAction:ok];
        [winner addAction:replay];
        [self presentViewController:winner animated:YES completion:nil];
        gameOver = TRUE;
    }
}

@end

