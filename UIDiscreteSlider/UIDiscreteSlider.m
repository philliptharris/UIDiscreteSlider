//
//  UIDiscreteSlider.m
//  UIDiscreteSlider
//
//  Created by Phillip Harris on 4/23/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "UIDiscreteSlider.h"

@implementation UIDiscreteSlider

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _increment = 0.1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//===============================================
#pragma mark -
#pragma mark UIControl Touch Tracking
//===============================================

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    BOOL shouldBeginTracking = [super beginTrackingWithTouch:touch withEvent:event];
    
    if (shouldBeginTracking) {
        [self processTouch:touch];
    }
    
    return shouldBeginTracking;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    BOOL shouldContinueTracking = [super continueTrackingWithTouch:touch withEvent:event];
    
    if (shouldContinueTracking) {
        [self processTouch:touch];
    }
    
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    [super endTrackingWithTouch:touch withEvent:event];
    
    [self processTouch:touch];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    
    [super cancelTrackingWithEvent:event];
}

//===============================================
#pragma mark -
#pragma mark Override the Value
//===============================================

- (void)processTouch:(UITouch *)touch {
    
    float fullDelta = (self.maximumValue - self.minimumValue);
    
    float percentage = (self.value - self.minimumValue) / fullDelta;
    
    int totalNumberOfSteps = (int)(fullDelta / self.increment);
    
    float steps = percentage * totalNumberOfSteps;
    
    float newValue = self.minimumValue + self.increment * roundf(steps);
    
    [self setValue:newValue animated:NO];
}

@end
