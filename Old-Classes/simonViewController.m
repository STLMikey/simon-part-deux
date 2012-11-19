//
//  simonViewController.m
//  simon
//
//  Created by Mike Roof on 2/5/10.
//  Copyright Mike Roof 2010. All rights reserved.
//

#import "simonViewController.h"
#import "superSimonViewController.h"
#import "gameOverViewController.h"

@implementation simonViewController
@synthesize statusText;
@synthesize scoreText;
@synthesize gameOverViewControl;
@synthesize dismissVariable;
int score = -1;
int cpuHist[100];
int	userHist[100];
int lastPressed = 0;
int roundNumber = 0;
int cpuTurnsTaken = 0;
int userTurnStatus = 0;
int timerTick = 0;
int usrTurnsTaken = 0;
int btnsHitThisTurn = 0;
int cpuBtnsThisTurn = 0;
int btnsNeeded = 0;
int imgColor = 5;
int soundsPlayed = 0;
int testVar = 0;
int soundToPlay = 0;
BOOL allowClicks = YES;



- (void)viewDidLoad {
	[super viewDidLoad];
	
	NSString *yellowSoundPath = [[NSBundle mainBundle] pathForResource:@"yellowBeep" ofType:@"aif"];
	NSURL *yellowSoundURL = [NSURL fileURLWithPath:yellowSoundPath];
	OSSAudioServicesCreateSystemSoundID ((CFURLRef)yellowSoundURL, &yellowSound);
	
	NSString *redSoundPath = [[NSBundle mainBundle] pathForResource:@"redBeep" ofType:@"aif"];
	NSURL *redSoundURL = [NSURL fileURLWithPath:redSoundPath];
	AudioServicesCreateSystemSoundID ((CFURLRef)redSoundURL, &redSound);
	
	NSString *greenSoundPath = [[NSBundle mainBundle] pathForResource:@"greenBeep" ofType:@"aif"];
	NSURL *greenSoundURL = [NSURL fileURLWithPath:greenSoundPath];
	AudioServicesCreateSystemSoundID ((CFURLRef)greenSoundURL, &greenSound);
	
	NSString *blueSoundPath = [[NSBundle mainBundle] pathForResource:@"blueBeep" ofType:@"aif"];
	NSURL *blueSoundURL = [NSURL fileURLWithPath:blueSoundPath];
	AudioServicesCreateSystemSoundID ((CFURLRef)blueSoundURL, &blueSound);
}
- (void)viewDidAppear:(BOOL)animated 
{
	[super viewDidAppear:animated];


	NSString *tempScore = @"0";
	scoreText.text = tempScore;
	[self performSelector:@selector(beginGame) withObject:nil afterDelay:1.25];
	NSLog(@"viewDidAppear");
}


-(void)reset
{
	roundNumber = 0;
	score = -1;
	lastPressed = 0;
	cpuTurnsTaken = 0;
	userTurnStatus = 0;
	timerTick = 0;
	usrTurnsTaken = 0;
	btnsHitThisTurn = 0;
	cpuBtnsThisTurn = 0;
	btnsNeeded = 0;
	imgColor = 5;
	soundsPlayed = 0;
	testVar = 0;
	soundToPlay = 0;
	allowClicks = YES;
	
}
-(void)beginGame
{
	
	if (dismissVariable == @"2") {
		[self dismissModalViewControllerAnimated:NO];
		NSLog(@"dismiss = correct");
	}
	[self reset];
	roundNumber++;
	cpuHist[0]=[self getRandomNum];
	[self updateScore];
	[self computerRecursive];
}
-(IBAction)startButtonpressed:(id)sender
{
	
	[self reset];
	roundNumber++;
	cpuHist[0]=[self getRandomNum];
	[self updateScore];
	[self computerRecursive];
	
		
}
-(void)updateScore{
	
	score++;
	NSString *theScore = [[NSString alloc] initWithFormat: @"%i",score];
	scoreText.text = theScore;
	
	
}
-(void)switchImage
{
	if (imgColor == 0) {
		[yellowButton setSelected:YES];
		[self performSelector:@selector(switchBack) withObject:nil afterDelay:0.1];
	}
	else if (imgColor == 1) {
		[redButton setSelected:YES];
		[self performSelector:@selector(switchBack) withObject:nil afterDelay:0.1];
	}
	else if (imgColor == 2) {
		[blueButton setSelected:YES];
		[self performSelector:@selector(switchBack) withObject:nil afterDelay:0.1];
	}
	else if (imgColor == 3) {
		[greenButton setSelected:YES];
		[self performSelector:@selector(switchBack) withObject:nil afterDelay:0.1];
	}
}
-(void)switchBack
{
	if (imgColor == 0) {
		[yellowButton setSelected:NO];
	}
	else if (imgColor == 1) {
		[redButton setSelected:NO];
	}
	else if (imgColor == 2) {
		[blueButton setSelected:NO];
	}
	else if (imgColor == 3) {
		[greenButton setSelected:NO];
	}
}
-(void)soundToPlay
{
	if (soundToPlay == 0) {
		AudioServicesPlaySystemSound(yellowSound);
	}
	if (soundToPlay == 1) {
		AudioServicesPlaySystemSound(redSound);
	}
	if (soundToPlay == 2) {
		AudioServicesPlaySystemSound(blueSound);
	}
	if (soundToPlay == 3) {
		AudioServicesPlaySystemSound(greenSound);
	}
}
	
-(void)computerRecursive
{
	allowClicks = NO;
	
		
	if (soundsPlayed == roundNumber) {
		//end turn
		cpuBtnsThisTurn++;
		
		[self newUserTurn];
	}
	
	else if (soundsPlayed != roundNumber) {
			if (cpuHist[soundsPlayed] == 0) {
				AudioServicesPlaySystemSound(yellowSound);
				soundsPlayed++;
				imgColor = 0;
				[self switchImage];
			}
			else if (cpuHist[soundsPlayed] == 1) {
				AudioServicesPlaySystemSound(redSound);
				soundsPlayed++;
				imgColor = 1;
				[self switchImage];
			}
			else if (cpuHist[soundsPlayed] == 2) {
				AudioServicesPlaySystemSound(blueSound);
				soundsPlayed++;
				imgColor = 2;
				[self switchImage];
			}
			else if (cpuHist[soundsPlayed] == 3) {
				AudioServicesPlaySystemSound(greenSound);
				soundsPlayed++;
				imgColor = 3;
				[self switchImage];
			}
			
			[self performSelector:@selector(computerRecursive) withObject:nil afterDelay:.5];
		
	}
}
-(void)disableButtons
{
	[yellowButton setEnabled:NO];
	[redButton setEnabled:NO];
	[blueButton setEnabled:NO];
	[greenButton setEnabled:NO];
}
-(void)enableButtons
{
	[yellowButton setEnabled:YES];
	[redButton setEnabled:YES];
	[blueButton setEnabled:YES];
	[greenButton setEnabled:YES];
}
-(void)newUserTurn
{
	
	btnsNeeded = cpuBtnsThisTurn;
	btnsHitThisTurn = 0;
	soundsPlayed=0;
	allowClicks = YES;
	
}
-(int)getRandomNum
{
	srand([[NSDate date] timeIntervalSince1970]);
	
	int btn = rand() % 4;
	
	return btn;
}
-(void)checkRoundEnd
{
	if (btnsHitThisTurn == btnsNeeded) {
		roundNumber = roundNumber +1;
		btnsNeeded = roundNumber;
		
		//get random number for next value in the cpu-array
		cpuHist[roundNumber-1]= [self getRandomNum];
		allowClicks = NO;
		
		[self performSelector:@selector(computerRecursive) withObject:nil afterDelay:1.10];
	}
	else {
		int x = 1;
		x++;
	}
}
-(void)switchToGameOverView
{
	
	[UIView beginAnimations:@"flipTransition" context:nil];
	[UIView setAnimationDuration: 1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:[[self navigationController] view] cache:NO];
	//create your view controller
	//push your view controller
		
	gameOverViewController *gameOverController = [[gameOverViewController alloc] initWithNibName:@"gameOverViewController" bundle:nil];
	
	NSString *scoreToPass = [[NSString alloc] initWithFormat: @"%i",score];
	
	gameOverController.playerScoreString = scoreToPass;
	gameOverController.highScoreText = score;
	gameOverController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	//[self presentModalViewController:gameOverController animated:YES];
	//[gameOverController release];
	//[self dismissModalViewControllerAnimated:YES];
	[[self navigationController] pushViewController:gameOverController animated:YES];	

	[UIView commitAnimations];

}

-(IBAction)yellowButtonPressed:(id)sender
{
	if (allowClicks == YES)
	{
		AudioServicesPlaySystemSound(yellowSound);
		userHist[btnsHitThisTurn] = 0;
		
		if (userHist[btnsHitThisTurn] == cpuHist[btnsHitThisTurn])
		{
			btnsHitThisTurn++;
			[self updateScore];
			[self checkRoundEnd];
		}
		else {
			allowClicks = NO;
			[self switchToGameOverView];
		}
	}
}
-(IBAction)redButtonPressed:(id)sender
{
	if (allowClicks == YES) 
	{
		AudioServicesPlaySystemSound(redSound);
		userHist[btnsHitThisTurn] = 1;
		
		if (userHist[btnsHitThisTurn] == cpuHist[btnsHitThisTurn])
		{
			btnsHitThisTurn++;
			[self updateScore];
			[self checkRoundEnd];
		}
		else 
		{
			
			allowClicks = NO;
			[self switchToGameOverView];
		}
	}
}

-(IBAction)blueButtonPressed:(id)sender
{
	if (allowClicks == YES) 
	{
		AudioServicesPlaySystemSound(blueSound);
		userHist[btnsHitThisTurn] = 2;
		
		if (userHist[btnsHitThisTurn] == cpuHist[btnsHitThisTurn])
		{
			btnsHitThisTurn++;
			[self updateScore];
			[self checkRoundEnd];
		}
		else
		{
			allowClicks = NO;
			[self switchToGameOverView];
		}
	}
}

-(IBAction)greenButtonPressed:(id)sender
{
	if (allowClicks == YES)
	{
		AudioServicesPlaySystemSound(greenSound);
		userHist[btnsHitThisTurn] = 3;
		
		if (userHist[btnsHitThisTurn] == cpuHist[btnsHitThisTurn])
		{
			btnsHitThisTurn++;
			[self updateScore];
			[self checkRoundEnd];
		}
		else 
		{
			allowClicks = NO;
			[self switchToGameOverView];
		}
	}

}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc {
	[statusText release];
    [super dealloc];
}

@end



