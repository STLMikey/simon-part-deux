//
//  SimonViewController.m
//  Simon Part Deux
//
//  Created by Mike Roof on 11/18/12.
//  Copyright (c) 2012 Mike Roof. All rights reserved.
//

#import "SimonViewController.h"

@interface SimonViewController ()

@end

@implementation SimonViewController
@synthesize game_instance;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)redButtonPressed:(id)sender {
    [game_instance gameButtonPressed:@"red"];
}
- (IBAction)greenButtonPressed:(id)sender {
    [game_instance gameButtonPressed:@"green"];
}
- (IBAction)blueButtonPressed:(id)sender {
    [game_instance gameButtonPressed:@"blue"];
}
- (IBAction)yellowButtonPressed:(id)sender {
    [game_instance gameButtonPressed:@"yellow"];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"SimonControllerLoaded");
	// Do any additional setup after loading the view.
    GameFactory *factory     = [[GameFactory alloc] init];
    game_instance = [factory createNewSimonGame:self];
    [game_instance startNewGame];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
