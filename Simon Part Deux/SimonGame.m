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
@synthesize yellowSound;
@synthesize redSound;
@synthesize blueSound;
@synthesize greenSound;
@synthesize sounds;

-(void)startNewGame {
    NSLog(@"Game Begun!");
    [self initializeGameValues];
    [self setRound_number:0];
    [self beginRound];
}
-(void)initializeGameValues {

	NSString *yellowSoundPath = [[NSBundle mainBundle] pathForResource:@"yellowBeep" ofType:@"aif" inDirectory:@"simon_sounds"];
	NSURL *yellowSoundURL = [NSURL fileURLWithPath:yellowSoundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)yellowSoundURL, &yellowSound);
    
    NSString *redSoundPath = [[NSBundle mainBundle] pathForResource:@"redBeep" ofType:@"aif" inDirectory:@"simon_sounds"];
	NSURL *redSoundURL = [NSURL fileURLWithPath:redSoundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)redSoundURL, &redSound);
    
    NSString *greenSoundPath = [[NSBundle mainBundle] pathForResource:@"greenBeep" ofType:@"aif" inDirectory:@"simon_sounds"];
	NSURL *greenSoundURL = [NSURL fileURLWithPath:greenSoundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)greenSoundURL, &greenSound);
    
    NSString *blueSoundPath = [[NSBundle mainBundle] pathForResource:@"blueBeep" ofType:@"aif" inDirectory:@"simon_sounds"];
	NSURL *blueSoundURL = [NSURL fileURLWithPath:blueSoundPath];
    AudioServicesCreateSystemSoundID ((__bridge CFURLRef)blueSoundURL, &blueSound);
   
}
-(BOOL)isGameOver {
    //TODO: Add logic for this later
    return false;
        //return true;
}
-(void)beginRound{
    //TODO: actual gameplay
    [self addMoveToComputerPattern];
    [self playComputerTurn];
  
}
-(void)addMoveToComputerPattern {
    srand([[NSDate date] timeIntervalSince1970]);
	int random_num = rand() % 4;
    [cpu_move_history addObject:[NSNumber numberWithInt: random_num]];
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
-(void)playSound:(int)color {
    switch(color){
        case 1:
            AudioServicesPlaySystemSound(redSound);
            break;
        case 2:
            AudioServicesPlaySystemSound(blueSound);
            break;
        case 3:
            AudioServicesPlaySystemSound(greenSound);
            break;
        case 4:
            AudioServicesPlaySystemSound(yellowSound);
            break;
        default:
            break;
    }
    
}
-(void)gameButtonPressed: (NSString*)color {
    NSLog(@"%@", color);
   
    int color_int = [self mapColorStringToInt:color];
    [self playSound:color_int];
    //check if button hit matches button in cpu history
    if(color_int == (int)cpu_move_history[human_buttons_hit]) {
        human_buttons_hit++;

        if(human_buttons_hit == [cpu_move_history count]) {
            //if at end of cpu array, next round
            round_number++;
            [self beginRound];
        }
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
