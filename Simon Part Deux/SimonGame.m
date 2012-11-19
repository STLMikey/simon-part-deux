//
//  SimonGame.m
//  Simon Part Deux
//
//  Created by Mike Roof on 11/18/12.
//  Copyright (c) 2012 Mike Roof. All rights reserved.
//

#import "SimonGame.h"

@implementation SimonGame
@synthesize parentViewController;
@synthesize cpu_move_history;
@synthesize human_move_history;
@synthesize round_number;
@synthesize sounds_played;
@synthesize human_buttons_hit;
-(void)startNewGame {
    NSLog(@"Game Begun!");
    [self setRound_number:0];
    [self beginRound];
}
-(BOOL)isGameOver {
    //TODO: Add logic for this later
    return false;
        //return true;
}
-(void)beginRound{
    //TODO: actual gameplay
    if([self isComputerTurn:round_number]) {
        [self addMoveToComputerPattern];
        [self playComputerTurn];
    }
    else{
        [self playHumanTurn];
    }
    
    
    if([self isGameOver]) {
        [self showGameOverView];
    }
}
-(void)addMoveToComputerPattern {
    srand([[NSDate date] timeIntervalSince1970]);
	int random_num = rand() % 4;
    [cpu_move_history addObject:[NSNumber numberWithInt: random_num]];
}
-(BOOL)isComputerTurn: (int)round_num {
    if(round_num % 2 == 0 || round_num == 0) {
        self.computer_turn = true;
        self.human_turn = false;
        return true;
    }
    else{
        self.computer_turn = false;
        self.human_turn = true;
        return false;
    }
}
-(void)playComputerTurn {
    int non_zero_round_num = round_number + 1;
    if (sounds_played == non_zero_round_num && sounds_played != 0) {
        sounds_played = 0;
        //end turn
	}
	else if (sounds_played != non_zero_round_num) {
        //playSound:cpu_move_history[sounds_played]
        //switchImage:""
        sounds_played++;
        [self performSelector:@selector(playComputerTurn) withObject:nil afterDelay:.5];
	}
}

-(void)gameButtonPressed: (NSString*)color {
    NSLog(@"%@", color);
    int color_int = [self mapColorStringToInt:color];
    //check if button hit matches button in cpu history
    if(color_int == (int)cpu_move_history[human_buttons_hit]) {
        human_buttons_hit++;
        //if at end of cpu array, do computer turn
    }
    else{
        //if not, game over
    }

    
    
}
-(int)mapColorStringToInt:(NSString *)color {
    int color_int;
    if(color == @"red") {
        color_int = 1;
    }
    else if (color == @"blue") {
        color_int = 2;
    }
    else if (color == @"green") {
        color_int = 3;
    }
    else if (color == @"yellow") {
        color_int = 4;
    }
    else{
        color_int = 0;
    }
    return color_int;
}
-(id)initWithViewController:(id)vc {
    self = [super init];
    if(self && vc) {
        [self setParentViewController:vc];
    }
    return self;
}
-(void)showGameOverView {
    [parentViewController performSegueWithIdentifier:@"showGameOver" sender:self];
}

@end
