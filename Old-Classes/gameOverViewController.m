////
////  gameOverViewController.m
////  superSimon
////
////  Created by Mike Roof on 3/10/10.
////  Copyright 2010 Mike Roof. All rights reserved.
////
//
//#import "gameOverViewController.h"
//#import "superSimonAppDelegate.h"
//
//
//@implementation gameOverViewController
//@synthesize playerScore;
//@synthesize highScore;
//@synthesize playerScoreString;
//@synthesize simonViewControl;
//@synthesize highScoreText;
//@synthesize cameFromMenu;
////@synthesize superSimonViewControl;
//
//
//
//
//- (void)viewWillAppear:(BOOL)animated
//{
//	playerScore.text = self.playerScoreString;
//
//	[self updateHighScore];
//	
//}
//
//- (void)dealloc {
//    [super dealloc];
//}
//- (void)updateHighScore
//{
//	
//	NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//	int prevHighScore = [prefs integerForKey:@"HighScore"];
//	//if current score is greater than high score
//	NSLog(@"%i",highScoreText);
//	NSLog(@"%i",prevHighScore);
//	if (highScoreText > prevHighScore || prevHighScore == 0)
//	{	
//		//set
//		[prefs setInteger:highScoreText  forKey:@"HighScore"];
//		[prefs synchronize];
//		
//		int labelDisplay = [prefs integerForKey:@"HighScore"];
//		
//		NSString *highScoreLabel = [[NSString alloc] initWithFormat: @"%i",labelDisplay];
//		highScore.text = highScoreLabel;
//	
//	}
//	else if (prevHighScore > highScoreText)
//	{
//		//retrieve	
//		int labelDisplay = [prefs integerForKey:@"HighScore"];
//		
//		NSString *highScoreLabel = [[NSString alloc] initWithFormat: @"%i",labelDisplay];
//		highScore.text = highScoreLabel;
//	}		
//}
//-(IBAction)exitButtonPressed:(id)sender
//{
//	//return to main menu
///*	superSimonAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    [appDelegate newGameFromOver];
//	
//	simonViewController *simonController = [[simonViewController alloc] initWithNibName:@"simonViewController" bundle:nil];
//	
//	 NSString *disVar = [[NSString alloc] initWithFormat: @"2"];
//
//	simonController.dismissVariable = disVar;
//	
//	[self dismissModalViewControllerAnimated:YES];
//*/	
//	
//	[[self navigationController] popToRootViewControllerAnimated:YES];
//}
//-(IBAction)newGameButtonPressed:(id)sender
//{
//	//return to main menu
//	//superSimonAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//    //[appDelegate newGameFromOver];
////	simonViewController *simonController = [[simonViewController alloc] initWithNibName:@"simonViewController" bundle:nil];
////	simonController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
////	[self presentModalViewController:simonController animated:YES];
////	[simonController release];
////	[self dismissModalViewControllerAnimated:YES];
//	
//	
//	[UIView beginAnimations:@"flipTransition" context:nil];
//	[UIView setAnimationDuration: 1.0];
//	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[[self navigationController] view] cache:NO];
//	
//	if (cameFromMenu == 1) {
//		//do this
//		
//		NSLog(@"camefrommenu loop");
//		simonViewControl = [[simonViewController alloc] initWithNibName:@"simonViewController" bundle:nil];
//		
//		cameFromMenu = 0;
//		
//		[[self navigationController] pushViewController:simonViewControl animated:YES];
//		superSimonAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//		[appDelegate newGameFromOver];
//		[UIView commitAnimations];
//	}
//	else 
//	{
//		NSLog(@"did not come from menu loop");
//		superSimonAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//		[appDelegate newGameFromOver];
//		[[self navigationController] popViewControllerAnimated:YES];
//		[UIView commitAnimations];
//	}
//	
//}
//-(void)newGame
//{
//	
//}
//
///*
// 
// //Saving.
// //Saves and object and assigns a key for retrival.
// [[NSUserDefaults standardUserDefaults] setObject:myObject forKey:@"myObject"]; 
// 
// //Tells the userDefaults to update the data base.
// [[NSUserDefaults standardUserDefaults] synchronize];
// Note that the setObject may vary, if saving an integer it would be setInteger: forKey
// 
// //Retrieving Data.
// id myObject = [[NSUserDefaults standardUserDefaults] objectForKey:@"myObject"];
// 
// 
// 
// NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
// 
// [prefs setInteger:HighScore  forKey:@"HighScore "];
// 
// [prefs synchronize];
// and retrieving:
// 
// HighScore  = [prefs integerForKey:@"HighScore"];
// 
// */
//
//@end
