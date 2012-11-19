//
//  simonViewController.h
//  simon
//
//  Created by Mike Roof on 2/5/10.
//  Copyright Mike Roof 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>

@class gameOverViewController;

@interface simonViewController : UIViewController {

	IBOutlet	UILabel *statusText;
	IBOutlet	UILabel	*scoreText;
	IBOutlet	UIButton *redButton;
	IBOutlet	UIButton *greenButton;
	IBOutlet	UIButton *blueButton;
	IBOutlet	UIButton *yellowButton;
	SystemSoundID yellowSound;
	SystemSoundID redSound;
	SystemSoundID blueSound;
	SystemSoundID greenSound;
	IBOutlet gameOverViewController *gameOverViewControl;
	NSString *dismissVariable;
	

}
@property (retain, nonatomic) IBOutlet gameOverViewController *gameOverViewControl;
@property (retain, nonatomic) UILabel *statusText;
@property (retain, nonatomic) UILabel *scoreText;
@property (readwrite, retain, nonatomic) NSString *dismissVariable;

-(void)updateScore;
-(int)getRandomNum;
-(void)computerTurn;
-(void)newUserTurn;
-(void)checkRoundEnd;
-(void)switchImage;
-(void)switchBack;
-(void)computerRecursive;
-(void)enableButtons;
-(void)disableButtons;
-(void)reset;
-(void)switchToGameOverView;
-(IBAction)yellowButtonPressed:(id)sender;
-(IBAction)redButtonPressed:(id)sender;
-(IBAction)blueButtonPressed:(id)sender;
-(IBAction)greenButtonPressed:(id)sender;
-(IBAction)startButtonpressed:(id)sender;



@end

