//
//  ViewController.m
//  UIAnimationSamples
//
//  Created by Ray Wenderlich on 11/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize movingButton;

static int curveValues[] = {
    UIViewAnimationOptionCurveEaseInOut,
    UIViewAnimationOptionCurveEaseIn,
    UIViewAnimationOptionCurveEaseOut,
    UIViewAnimationOptionCurveLinear };

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    curvesList = [[NSMutableArray alloc] initWithObjects:@"EaseInOut",@"EaseIn",@"EaseOut",@"Linear", nil];
    selectedCurveIndex = 0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - animation actions

- (IBAction) btnMoveTo:(id)sender
{
    UIButton* button= (UIButton*)sender;
    [movingButton moveTo:
     CGPointMake(button.center.x - (movingButton.frame.size.width/2),
                 button.frame.origin.y - (movingButton.frame.size.height + 5.0))
                duration:1.0 
                  option:curveValues[selectedCurveIndex]];	// above the tapped button
}

- (IBAction) btnDownUnder:(id)sender
{
	UIButton* button= (UIButton*)sender;
	[button downUnder:1.0 option:curveValues[selectedCurveIndex]];
}

- (IBAction) btnZoom:(id)sender
{
	UIButton* button= (UIButton*)sender;
	pickerView = [AnimationCurvePicker newAnimationCurvePicker:self];
	// the animation will start in the middle of the button
	pickerView.center = button.center;
	[self.view addSubviewWithZoomInAnimation:pickerView duration:1.0 option:curveValues[selectedCurveIndex]];
}

#pragma mark - animation curves picker
// handling the picker, that is a simple tableview in this example
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [curvesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"]; 
	
	if (cell == nil)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	cell.textLabel.text = [curvesList objectAtIndex:indexPath.row];
	
	if (indexPath.row == selectedCurveIndex)
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Select the Animation Curve to be used";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
	return @"Curves will not affect total duration but instant speed and acceleration";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	if (selectedCurveIndex != indexPath.row)
	{
		NSIndexPath *oldPath = [NSIndexPath indexPathForRow:selectedCurveIndex inSection:indexPath.section];
		cell = [tableView cellForRowAtIndexPath:oldPath];
		cell.accessoryType = UITableViewCellAccessoryNone;
		
		selectedCurveIndex = indexPath.row;
	}
	
	if (pickerView)
	{
		[pickerView removeWithZoomOutAnimation:1.0 option:curveValues[selectedCurveIndex]];
		pickerView = nil;
	}
}

- (IBAction) btnHUD:(id)sender
{
	FakeHUD *theSubView = [FakeHUD newFakeHUD];
	[self.view addSubviewWithFadeAnimation:theSubView duration:1.0 option:curveValues[selectedCurveIndex]];
}

@end
