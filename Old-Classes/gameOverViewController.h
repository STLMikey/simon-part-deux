/*//
//  gameOverViewController.h
//  superSimon
//
//  Created by Mike Roof on 3/10/10.
//  Copyright 2010 Mike Roof. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "simonViewController.h"
@class simonViewController;

@interface gameOverViewController : UIViewController {

	IBOutlet	UILabel *playerScore;
	IBOutlet	UILabel	*highScore;
	IBOutlet	UIButton *newGameButton;
	IBOutlet	UIButton *exitButton;
	
	NSString *playerScoreString;
	int highScoreText;
	int cameFromMenu;
	simonViewController *simonViewControl;
	//superSimonViewController *superSimonViewControl;
	
}
@property (retain, nonatomic) simonViewController *simonViewControl;
@property (assign, nonatomic) UILabel *playerScore;
@property (assign, nonatomic) UILabel *highScore;

//@property (retain, nonatomic) superSimonViewController *superSimonViewControl;

@property (readwrite, retain, nonatomic) NSString *playerScoreString;
@property (readwrite, assign, nonatomic) int highScoreText;
@property (readwrite, assign, nonatomic) int cameFromMenu;
-(IBAction)newGameButtonPressed:(id)sender;
-(IBAction)exitButtonPressed:(id)sender;
-(void)newGame;
-(void)updateHighScore;

@end
*/