//
//  KRPulsingOverlayViewController.m
//  KRPulsingOverlayViewDemo
//
//  Created by Kieran O'Neill on 07/01/2015.
//  Copyright (c) 2015 Kieran O'Neill. All rights reserved.
//

#import "KRPulsingOverlayViewController.h"

#import "KRPulsingOverlayView.h"

@implementation KRPulsingOverlayViewController

@synthesize durationTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - IBActions.

-(IBAction)onPulseButtonPress:(id)sender
{
    NSString* numberString = ([self.durationTextField.text isEqualToString:@""]) ? @"0.0" : self.durationTextField.text;
    NSNumber* duration = [NSNumber numberWithDouble:0.0];
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    duration = [numberFormatter numberFromString:numberString];
    
    if([duration doubleValue] > 0)
    {
        KRPulsingOverlayView* pulseView = [KRPulsingOverlayView initialiseWithViewController:self];
        
        pulseView.backgroundColour = [UIColor cyanColor];
        pulseView.pulseColor = [UIColor magentaColor];
        
        [pulseView show];
        
        // After a delay animate dismiss the loading overlay.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, [duration doubleValue] * NSEC_PER_SEC), dispatch_get_main_queue(), ^
        {
            [pulseView dismiss:nil];
        });
    }
}

-(IBAction)onPulseAlertButtonPress:(id)sender
{
    NSString* numberString = ([self.durationTextField.text isEqualToString:@""]) ? @"0.0" : self.durationTextField.text;
    NSNumber* duration = [NSNumber numberWithDouble:0.0];
    NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    duration = [numberFormatter numberFromString:numberString];
    
    if([duration doubleValue] > 0)
    {
        KRPulsingOverlayView* pulseView = [KRPulsingOverlayView initialiseWithViewController:self];
        
        pulseView.backgroundColour = [UIColor cyanColor];
        pulseView.pulseColor = [UIColor magentaColor];
        
        [pulseView show];
        
        // After a delay animate dismiss the loading overlay.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, [duration doubleValue] * NSEC_PER_SEC), dispatch_get_main_queue(), ^
        {
            // Show and alert when the animation has finished.
            [pulseView dismiss:^(BOOL finished)
            {
                UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Finished!" message:@"The pulsing has stopped." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [alertView show];
            }];
        });
    }
}

@end
