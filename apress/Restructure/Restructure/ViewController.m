//
//  ViewController.m
//  Restructure
//
//  Created by Rachel Schifano on 1/18/15.
//  Copyright (c) 2015 apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *actionButton1;
@property (strong, nonatomic) IBOutlet UIView *actionButton2;
@property (weak, nonatomic) IBOutlet UIButton *actionButton3;
@property (weak, nonatomic) IBOutlet UIButton *actionButton4;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Called automatically after device has been rotated into a new orientation
// Called just before final rotation animations occurred
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation) toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self doLayoutForOrientation:toInterfaceOrientation];
}

- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [self layoutPortrait];
    } else {
        [self layoutLandscape];
    }
}

static const CGFloat buttonHeight = 40;
static const CGFloat buttonWidth = 120;
static const CGFloat spacing = 20;

- (void)layoutPortrait {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - (2 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (4 * spacing) - (2 * buttonHeight);
    
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    CGFloat buttonRow1y = contentHeight + (2 * spacing);
    CGFloat buttonRow2y = buttonRow1y + buttonHeight + spacing;
    
    CGFloat buttonCol1x = spacing;
    CGFloat buttonCol2x = CGRectGetWidth(b) - buttonWidth - spacing;
    
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y, buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y, buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y, buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y, buttonWidth, buttonHeight);
}

- (void)layoutLandscape {
    CGRect b = self.view.bounds;
    
    CGFloat contentWidth = CGRectGetWidth(b) - buttonWidth - (3 * spacing);
    CGFloat contentHeight = CGRectGetHeight(b) - (2 * spacing);
    
    self.contentView.frame = CGRectMake(spacing, spacing, contentWidth, contentHeight);
    
    CGFloat buttonX = CGRectGetWidth(b) - buttonWidth - spacing;
    CGFloat buttonRow1y = spacing;
    CGFloat buttonRow4y = CGRectGetHeight(b) - buttonHeight - spacing;
    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y - buttonRow1y) * 0.667);
    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y - buttonRow1y) * 0.667);
    
    self.actionButton1.frame = CGRectMake(buttonX, buttonRow1y, buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y, buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y, buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y, buttonWidth, buttonHeight);
}

@end
