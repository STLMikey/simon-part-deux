//
//  GameFactory.m
//  Simon Part Deux
//
//  Created by Mike Roof on 11/18/12.
//  Copyright (c) 2012 Mike Roof. All rights reserved.
//

#import "GameFactory.h"

@implementation GameFactory

-(SimonGame *)createNewSimonGame: (SimonViewController*)vc {
    
    SimonGame *new_game = [[SimonGame alloc] initWithViewController:vc];
    return new_game;
}
@end
