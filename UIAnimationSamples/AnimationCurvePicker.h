//
//  AnimationCurvePicker.h
//  UIAnimationSamples
//
//  Created by Ray Wenderlich on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationCurvePicker : UIView
@property (nonatomic,weak) IBOutlet UITableView *animationlist;

+ (id) newAnimationCurvePicker:(id)pickDelegate;
@end