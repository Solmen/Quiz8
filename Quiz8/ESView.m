//
//  ESView.m
//  Quiz8
//
//  Created by Samuel Tolkin on 4/15/14.
//  Copyright (c) 2014 Samuel Tolkin. All rights reserved.
//

#import "ESView.h"

@implementation ESView
@synthesize currentPoint, currentHorizontalAngle, currentVelocity, currentVerticalAngle;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        points = [[NSMutableArray alloc] init];
    }
    [self becomeFirstResponder];
    return self;
}

- (void)saveCurrentPoint
{
    [points addObject:[NSValue valueWithCGPoint:currentPoint]];
    [self setNeedsDisplay];
    currentHorizontalAngle = 0;
    currentVerticalAngle = 0;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    // Set up the line and the starting point of your line
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    [bz setLineWidth:3.0];
    [[UIColor blackColor] setStroke];
    [bz moveToPoint:[[points firstObject] CGPointValue]];
    for (id p in points)
    {
        [bz addLineToPoint:[p CGPointValue]];
    }
    
    // Causes the lines to change when the rotation gesutures are engaged
    CGPoint lastPoint = [[points lastObject]CGPointValue];
    currentPoint = CGPointMake(lastPoint.x + self.currentHorizontalAngle*10.0, lastPoint.y + self.currentVerticalAngle*10.0);
    
    // makes sure that the currentPoint is within the correct bounds
    if (currentPoint.x < 0)
    {
        currentPoint.x = 0;
    }
    
    if (currentPoint.y < 0)
    {
        currentPoint.y = 0;
    }
    if (currentPoint.x > self.bounds.size.width)
    {
        currentPoint.x = self.bounds.size.width;
    }
    if (currentPoint.y > self.bounds.size.height)
    {
        currentPoint.y = self.bounds.size.height;
    }
    
    // Trying to fix a bug
    //[points removeObjectAtIndex:0];
    //[points insertObject:[NSValue valueWithCGPoint:currentPoint] atIndex:0];
    
    // Draw the line
    [bz addLineToPoint:currentPoint];
    [self saveCurrentPoint];
    [bz stroke];
    
    [self drawCurrentPoint];
}

- (void)drawCurrentPoint
{
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:4];
    CGPoint p = CGPointMake(currentPoint.x-2, currentPoint.y-2);
    [path addLineToPoint:p];
    p.x += 2.0;
    [path addLineToPoint:p];
    p.y += 2.0;
    [path addLineToPoint:p];
    p.x -= 2.0;
    [path addLineToPoint:p];
    p.y -= 2.0;
    [path addLineToPoint:p];
    [path stroke];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        NSLog(@"Device started shaking!");
        [points removeAllObjects];
        [self saveCurrentPoint];
        //[points addObject:[NSValue valueWithCGPoint:currentPoint]];
        //[self setNeedsDisplay];
    }
    
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)])
    {
        [super motionEnded:motion withEvent:event];
    }
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

@end
