//
//  Quiz8ViewController.h
//  Quiz8
//
//  Created by Samuel Tolkin on 4/11/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESView.h"

@interface Quiz8ViewController : UIViewController
- (IBAction)addVertical:(id)sender;
- (IBAction)addHorizontial:(id)sender;
@property (weak, nonatomic) IBOutlet ESView *sketchyView;

@property (nonatomic) float lastVelocity;

@end

