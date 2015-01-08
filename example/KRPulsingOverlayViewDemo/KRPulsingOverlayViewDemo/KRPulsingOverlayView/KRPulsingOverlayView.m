//
//  KRPulsingOverlayView.m
//
//  Created by Kieran O'Neill on 07/01/2015.

#import "KRPulsingOverlayView.h"

@interface KRPulsingOverlayView ()

@property (strong, nonatomic) UIViewController* viewController;
@property (strong, nonatomic) UIView* backgroundOverlayView;
@property (strong, nonatomic) UIView* pulseContainerView;
@property (strong, nonatomic) NSMutableArray* pulseViewArray;
@property (readwrite, nonatomic) NSTimeInterval pulseInterval;

-(id)initWithViewController:(UIViewController*)theViewController;

/**
 * Convenience method for setting up the pulses.
 */
-(void)setUpPulseViews;

@end

@implementation KRPulsingOverlayView

#define kFadeInOutDuration ((NSTimeInterval) 0.4)

#pragma mark - Initialisers

-(id)initWithViewController:(UIViewController *)theViewController
{
    self = [super init];
    
    if(self)
    {
        self.viewController = theViewController;
        
        // Set default values.
        self.backgroundColour = [UIColor whiteColor];
        self.pulseColor = [UIColor cyanColor];
        self.pulseDiameter = 30.0f;
        self.pulseInterval = 0.16f;
        
        self.pulseViewArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - Static methods.

+(KRPulsingOverlayView*)initialiseWithViewController:(UIViewController *)viewController
{
    KRPulsingOverlayView* pulsingOverlayView = [[KRPulsingOverlayView alloc] initWithViewController:viewController];
    
    return pulsingOverlayView;
}

#pragma mark - Public methods.

-(void)dismiss:(void (^)(BOOL))completion
{
    // Animate the toast into view.
    [UIView animateWithDuration:kFadeInOutDuration animations:^
    {
        self.backgroundOverlayView.alpha = 0.0f;
    }
    completion:^(BOOL finished)
    {
        // Remove the view.
        [self removeFromSuperview];
        
        // Run the completion block if not nil.
        if(completion != nil)
        {
            completion(finished);
        }
    }];
}

-(void)show
{
    self.backgroundOverlayView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.pulseContainerView = [[UIView alloc] init];
    
    self.backgroundOverlayView.alpha = 0.0f;

    self.backgroundOverlayView.backgroundColor = self.backgroundColour;
    self.pulseContainerView.backgroundColor = [UIColor clearColor];
    
    // Set up the pulses.
    [self setUpPulseViews];
    
    // Add to view heirarchy.
    [self.backgroundOverlayView addSubview:self.pulseContainerView];
    [self.viewController.view addSubview:self.backgroundOverlayView];
    
    // Fade in the overlay.
    [UIView animateWithDuration:kFadeInOutDuration animations:^
    {
        self.backgroundOverlayView.alpha = 1.0f;
    }];
}

#pragma mark - Hidden methods.

-(void)setUpPulseViews
{
    for(int i = 0; i < 3; i++)
    {
        UIView* pulseView = nil;
        UIView* previousPulseView = nil;
        
        if(i == 0)
        {
            pulseView = [[UIView alloc] initWithFrame:CGRectMake(self.pulseContainerView.frame.origin.x, self.pulseContainerView.frame.origin.y, self.pulseDiameter, self.pulseDiameter)];
        }
        else
        {
            previousPulseView = [self.pulseViewArray objectAtIndex:i - 1];
            
            pulseView = [[UIView alloc] initWithFrame:CGRectMake((previousPulseView.frame.origin.x + previousPulseView.frame.size.width + 10), self.pulseContainerView.frame.origin.y, self.pulseDiameter, self.pulseDiameter)];
        }
        
        pulseView.backgroundColor = self.pulseColor;
        pulseView.layer.cornerRadius = pulseView.frame.size.height / 2;
        
        [self.pulseContainerView addSubview:pulseView];
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        CABasicAnimation *opactityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        
        scaleAnimation.duration = opactityAnimation.duration = 0.5;
        scaleAnimation.repeatCount = opactityAnimation.repeatCount = HUGE_VAL;
        
        scaleAnimation.autoreverses = YES;
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        scaleAnimation.toValue = [NSNumber numberWithFloat:0.0];
    
        opactityAnimation.fromValue = [NSNumber numberWithFloat:0.6];
        opactityAnimation.toValue = [NSNumber numberWithFloat:1.0];
        
        // Add animations, customise for different positions.
        if(i == 0)
        {
            [pulseView.layer addAnimation:scaleAnimation forKey:@"scale"];
            [pulseView.layer addAnimation:opactityAnimation forKey:@"opacity"];
        }
        else
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, self.pulseInterval * NSEC_PER_SEC), dispatch_get_main_queue(), ^(void)
            {
                [pulseView.layer addAnimation:scaleAnimation forKey:@"scale"];
                [pulseView.layer addAnimation:opactityAnimation forKey:@"opacity"];
            });
            
            // Increase pulse interval for next pulse.
            self.pulseInterval = self.pulseInterval + 0.16f;
        }
        
        [self.pulseViewArray addObject:pulseView];
    }
    
    CGFloat containerWidth = ((UIView*) [self.pulseViewArray objectAtIndex:self.pulseViewArray.count - 1]).frame.origin.x + ((UIView*) [self.pulseViewArray objectAtIndex:self.pulseViewArray.count - 1]).frame.size.width;
    
    // Resize the container view frame.
    self.pulseContainerView.frame = CGRectMake((self.backgroundOverlayView.center.x - (containerWidth / 2)), (self.backgroundOverlayView.center.y - (self.pulseDiameter / 2)), containerWidth, self.pulseDiameter);
}

@end
