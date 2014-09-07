//
//  BIDViewController.m
//  Control Fun
//
//  Created by Rachel Schifano on 9/1/14.
//  Copyright (c) 2014 Apress. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *numberField;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UIButton *doSomethingButton;

@end

@implementation BIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // assign correct slider value when loaded
    self.sliderLabel.text = @"50";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Tells text field to give up control
- (IBAction)textFieldDoneEditing:(id) sender
{
    [sender resignFirstResponder];
}

// Tells both text fields to yield first responder status if they have it
// Safe to call resignFirstResponder on a control that is not the FR, so can call without needing to check
// No need to call in .h file
- (IBAction)backgroundTap:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.numberField resignFirstResponder];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    // retrieve current value of slider and round to nearest int
    int progress = lroundf(sender.value);
    // create a string with slider value and assign to label
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", progress];
}
- (IBAction)switchChanged:(UISwitch *)sender {
    // if one switch is on, make them both on
    // better to set value of both switches than determine who made the call each time
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:YES];
    [self.rightSwitch setOn:setting animated:YES];
}
- (IBAction)toggleControls:(UISegmentedControl *)sender {
    // 0 == switches index
    if (sender.selectedSegmentIndex == 0) {
        self.leftSwitch.hidden = NO;
        self.rightSwitch.hidden = NO;
        self.doSomethingButton.hidden = YES;
    }
    else {
        self.leftSwitch.hidden = YES;
        self.rightSwitch.hidden = YES;
        self.doSomethingButton.hidden = NO;
    }
}
- (IBAction)buttonPressed:(id)sender {
    // Create and show action sheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"Are you sure?"
                                  delegate:self
                                  cancelButtonTitle:@"No Way!"
                                  destructiveButtonTitle:@"Yes, I'm sure!"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [actionSheet cancelButtonIndex]) {
        NSString *msg = nil;
        
        if ([self.nameField.text length] > 0) {
            msg = [NSString stringWithFormat:
                   @"You can breate easy, %@, everything went OK.", self.nameField.text];
        } else {
            msg = @"You can breathe easy, everything went OK.";
        }
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Something was done"
                              message:msg
                              delegate:self
                              cancelButtonTitle:@"Phew!"
                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
