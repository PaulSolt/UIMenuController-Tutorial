//
//  ViewController.m
//  UIMenuController
//
//  Created by Paul Solt on 4/16/14.
//  Copyright (c) 2014 Paul Solt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *tapView;

@end

@implementation ViewController


// Make sure you do this if you display full-screen ads or other modal windows from third-party sdks
//- (void)viewDidAppear:(BOOL)animated {
//    [self.view.window makeKeyWindow];
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer *tapGesture =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleTapGesture:)];
    [self.view addGestureRecognizer:tapGesture];
}


- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    NSLog(@"tapGesture:");
    CGRect targetRectangle = self.tapView.frame;
//    CGRect targetRectangle = CGRectMake(100, 100, 100, 100);
    [[UIMenuController sharedMenuController] setTargetRect:targetRectangle
                                                    inView:self.view];

    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"Custom Action"
                                                  action:@selector(customAction:)];

    [[UIMenuController sharedMenuController]
     setMenuItems:@[menuItem]];
    [[UIMenuController sharedMenuController]
     setMenuVisible:YES animated:YES];
    
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action
              withSender:(id)sender
{
    BOOL result = NO;
    if(@selector(copy:) == action ||
       @selector(customAction:) == action) {
        result = YES;
    }
    return result;
}

// UIMenuController Methods

// Default copy method
- (void)copy:(id)sender {
    NSLog(@"Copy");
}

// Our custom method
- (void)customAction:(id)sender {
    NSLog(@"Custom Action");
}

@end
