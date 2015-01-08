KRPulsingOverlayView
========

A view that adds a pulsing loading overlay to a UIViewController.

![Screenshot](/screenshots/krtoastr_screenshot.png?raw=true)

## Installation

1. Simply add the `KRPulsingOverlayView.h` and `KRPulsingOverlayView.m` source files to your project.
2. Include KRPulsingOverlayView wherever you need it with `#import "KRPulsingOverlayView.h"`.

## Usage

The main method for initialisation, `[KRPulsingOverlayView initialiseWithViewController:viewController]`, returns an initialised `KRPulsingOverlayView` view.

You can then customise some attributes that change the look of the pulse:

* `UIColor* backgroundColour` - changes the background colour of the overlay. Default: `[UIColor cyanColor]`.
* `UIColor* pulseColor` - changes the colour of the pulses Default: `[UIColor magentaColor]`.
* `CGFloat pulseDiameter` - changes the size of the pulses. Default: `30.f`.

Once you have edited the view you can display the view using `[KRPulsingOverlayView show]`. Once you have finished the long running task you can dismiss the view using `[KRPulsingOverlayView dismiss:(void (^)(BOOL finished))completion]`. The dismiss method also contains a completion block that is run as soon as the view has been removed from the parent heirarchy.

## Example

```objective-c
KRPulsingOverlayView* pulseView = [KRPulsingOverlayView initialiseWithViewController:self];

pulseView.backgroundColour = [UIColor blueColor];
pulseView.pulseColor = [UIColor whiteColor];
pulseView.pulseDiameter = 25.0f;

[pulseView show];

// ...once you have finsihed your long running task.
[pulseView dismiss:^(BOOL finished)
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Finished!" message:@"The pulsing has stopped." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

    [alertView show];
}];
```

## License

Copyright (c) 2015 Kieran O'Neill

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

- If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
