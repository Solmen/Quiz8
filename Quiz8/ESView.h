//
//  ESView.h
//  Quiz8
//
//  Created by Samuel Tolkin on 4/15/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESView : UIView
{
    NSMutableArray *points;
}
@property (nonatomic) CGFloat currentVelocity;
@property (nonatomic) CGFloat currentHorizontalAngle;
@property (nonatomic) CGFloat currentVerticalAngle;
@property (nonatomic) CGPoint currentPoint;
- (void)saveCurrentPoint;
- (void)drawCurrentPoint;
@end
