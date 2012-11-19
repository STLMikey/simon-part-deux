//
//  SimonGame.h
//  Simon Part Deux
//
//  Created by Mike Roof on 11/18/12.
//  Copyright (c) 2012 Mike Roof. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ROOFAppDelegate.h"
#import "SimonViewController.h"
#import "GameOverViewController.h"
@class SimonViewController;
@interface SimonGame : NSObject


@property SimonViewController* parentViewController;
@property int computer_turn;
@property int human_turn;
@property int round_number;
@property int sounds_played;
@property int human_buttons_hit;
@property NSMutableArray *cpu_move_history;
@property NSMutableArray *human_move_history;

-(void)gameButtonPressed: (NSString *)color;
-(id)initWithViewController: (SimonViewController*)vc;
-(BOOL)isComputerTurn: (int)round_number;
-(void)startNewGame;
-(void)beginRound;
-(BOOL)isGameOver;
-(void)playComputerTurn;
-(void)playHumanTurn;

@end
