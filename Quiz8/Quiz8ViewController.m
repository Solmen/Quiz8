//
//  Quiz8ViewController.m
//  Quiz8
//
//  Created by Samuel Tolkin on 4/11/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "Quiz8ViewController.h"

@interface Quiz8ViewController ()

@end

@implementation Quiz8ViewController
@synthesize lastVelocity;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addVertical:(id)sender
{
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"The vertical rotation. %f", s.rotation);
    NSLog(@"The vertical veloctiy. %f", s.velocity);
    [self.sketchyView saveCurrentPoint];
    if (lastVelocity > 0 && s.velocity < 0)
    {
        [self.sketchyView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0)
    {
        [self.sketchyView saveCurrentPoint];
    }
    [self.sketchyView setCurrentVerticalAngle:s.rotation];
    [self.sketchyView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded)
    {
        [self.sketchyView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
    
}

- (IBAction)addHorizontial:(id)sender
{
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"It happened horizontal. %f", s.rotation);
    NSLog(@"The horizontal veloctiy. %f", s.velocity);
    [self.sketchyView saveCurrentPoint];
    if (lastVelocity > 0 && s.velocity < 0)
    {
        [self.sketchyView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0)
    {
        [self.sketchyView saveCurrentPoint];
    }
    [self.sketchyView setCurrentHorizontalAngle:s.rotation];
    [self.sketchyView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded)
    {
        [self.sketchyView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
    
}

@end
