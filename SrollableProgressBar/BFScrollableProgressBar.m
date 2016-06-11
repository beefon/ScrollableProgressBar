//
//  BFScrollableProgressBar.m
//  SrollableProgressBar
//
//  Created by Vladislav Alexeev on 10/06/2016.
//  Copyright © 2016 beefon. All rights reserved.
//

#import "BFScrollableProgressBar.h"

@interface BFScrollableProgressBar ()

@property (nonatomic, strong) NSTimer *corrector;

@end

@implementation BFScrollableProgressBar

- (instancetype)initWithFrame:(NSRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.targetValue = (self.maxValue - self.minValue) / 2.0;
    self.doubleValue = self.targetValue;
    [self corrector];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
  self = [super initWithCoder:coder];
  if (self) {
    self.targetValue = (self.maxValue - self.minValue) / 2.0;
    self.doubleValue = self.targetValue;
    [self corrector];
  }
  return self;
}

- (void)setTargetValue:(double)targetValue
{
  if (_targetValue != targetValue) {
    _targetValue = fmax(fmin(targetValue, self.maxValue), self.minValue);
  }
}

- (NSTimer *)corrector
{
  if (_corrector == nil) {
    _corrector = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0
                                                  target:self
                                                selector:@selector(correct:)
                                                userInfo:nil
                                                 repeats:YES];
  }
  return _corrector;
}

- (void)correct:(NSTimer *)sender {
  double delta = (self.targetValue - self.doubleValue) / 5.0f;
  [self incrementBy:delta];
}

- (void)mouseDragged:(NSEvent *)theEvent {
  [super mouseDragged:theEvent];
  [self incrementBy:theEvent.deltaX / 2.0];
}

- (void)scrollWheel:(NSEvent *)theEvent {
  [super scrollWheel:theEvent];
  [self incrementBy:theEvent.deltaX];
}

@end
