//
//  SimonViewController.h
//  Simon Part Deux
//
//  Created by Mike Roof on 11/18/12.
//  Copyright (c) 2012 Mike Roof. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameFactory.h"
#import "GameOverViewController.h"
#import "SimonGame.h"
@class SimonGame;
@interface SimonViewController : UIViewController

@property SimonGame *game_instance;
- (IBAction)redButtonPressed:(id)sender;
- (IBAction)blueButtonPressed:(id)sender;
- (IBAction)greenButtonPressed:(id)sender;
- (IBAction)yellowButtonPressed:(id)sender;
@end
