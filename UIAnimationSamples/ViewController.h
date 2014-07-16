//
//  ViewController.h
//  UIAnimationSamples
//
//  Created by Ray Wenderlich on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Animation.h"
#import "AnimationCurvePicker.h"
#import "FakeHUD.h"

@interface ViewController : UIViewController {
    NSMutableArray *curvesList;
    int	selectedCurveIndex;
    UIView *pickerView;
}

@property (nonatomic,weak) IBOutlet UIButton *movingButton;

- (IBAction) btnMoveTo:(id)sender;
- (IBAction) btnDownUnder:(id)sender;
- (IBAction) btnZoom:(id)sender;
- (IBAction) btnHUD:(id)sender;

@end
