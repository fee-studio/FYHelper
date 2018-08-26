@import UIKit;

typedef void (^FYBackButtonHandler)(UINavigationController *navigationController);

@interface UIViewController (FYBackButtonTouched)

/**
 * Intercept UINavigationController's back button pop event!
 */
- (void)fy_backButtonTouched:(FYBackButtonHandler)backButtonHandler;

@end
