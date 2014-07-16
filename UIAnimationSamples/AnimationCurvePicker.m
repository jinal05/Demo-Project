//
//  AnimationCurvePicker.m
//  UIAnimationSamples
//
//  Created by Ray Wenderlich on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimationCurvePicker.h"

@implementation AnimationCurvePicker
@synthesize animationlist;

+ (id) newAnimationCurvePicker:(id)pickerDelegate
{
    UINib *nib = [UINib nibWithNibName:@"AnimationCurvePicker" bundle:nil];
    NSArray *nibArray = [nib instantiateWithOwner:self options:nil];
    AnimationCurvePicker *me = [nibArray objectAtIndex: 0];
    me.animationlist.delegate = pickerDelegate;
    
    
    
    //hello world
    
    me.animationlist.dataSource = pickerDelegate;
    return me;
}

@end
