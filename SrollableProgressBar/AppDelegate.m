//
//  AppDelegate.m
//  SrollableProgressBar
//
//  Created by Vladislav Alexeev on 10/06/2016.
//  Copyright © 2016 beefon. All rights reserved.
//

#import "AppDelegate.h"
#import "BFScrollableProgressBar.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet BFScrollableProgressBar *progress;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.timer = [NSTimer scheduledTimerWithTimeInterval:1/60.0
                                                target:self
                                              selector:@selector(increase)
                                              userInfo:nil
                                               repeats:YES];
}

- (void)increase {
  self.progress.targetValue += 0.05;
}

@end
