//
// KRPulsingOverlayView.h
//
// Copyright (c) 2014 Kieran O'Neill
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface KRPulsingOverlayView : UIView

@property (strong, nonatomic) UIColor* backgroundColour;
@property (strong, nonatomic) UIColor* pulseColor;
@property (readwrite, nonatomic) CGFloat pulseDiameter;

#pragma mark - Static methods.

/**
 * Intialises the view with the default values. It returns an
 * instance of the KRPulsingOverlayView view for customisation.
 *
 * @param viewController the viewcontroller to add the KRPulsingOverlayView to.
 * @return an initialised instance of KRPulsingOverlayView.
 */
+(KRPulsingOverlayView*)initialiseWithViewController:(UIViewController*)viewController;

#pragma mark - Public methods.

/**
 * Dismisses the KRPulsingOverlayView and runs the completion block when it has faded
 * out.
 *
 * @param completion a block to run when the KRPulsingOverlayView view disappears.
 */
-(void)dismiss:(void (^)(BOOL finished))completion;

/**
 * Shows the KRPulsingOverlayView.
 */
-(void)show;

@end
