//
//  KRPulsingOverlayViewController.h
//  KRPulsingOverlayViewDemo
//
//  Created by Kieran O'Neill on 07/01/2015.
//  Copyright (c) 2015 Kieran O'Neill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRPulsingOverlayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField* durationTextField;

#pragma mark - IBActions.

-(IBAction)onButtonPress:(id)sender;

@end
