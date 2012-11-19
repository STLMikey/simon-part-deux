//
//  GameFactory.h
//  Simon Part Deux
//
//  Created by Mike Roof on 11/18/12.
//  Copyright (c) 2012 Mike Roof. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimonGame.h"
#import "SimonViewController.h"
@class SimonViewController;
@class SimonGame;
@interface GameFactory : NSObject

-(SimonGame *)createNewSimonGame: (SimonViewController*)vc;
@end
