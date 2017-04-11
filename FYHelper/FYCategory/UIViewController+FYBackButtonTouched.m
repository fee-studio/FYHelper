#import <objc/runtime.h>
#import "UIViewController+FYBackButtonTouched.h"

static const void *FYBackButtonHandlerKey = &FYBackButtonHandlerKey;

@implementation UIViewController (FYBackButtonTouched)
- (void)fy_backButtonTouched:(FYBackButtonHandler)backButtonHandler {
    objc_setAssociatedObject(self, FYBackButtonHandlerKey, backButtonHandler, OBJC_ASSOCIATION_COPY);
}

- (FYBackButtonHandler)fy_backButtonTouched {
    return objc_getAssociatedObject(self, FYBackButtonHandlerKey);
}
@end

@implementation UINavigationController (ShouldPopItem)
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    if ([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }

    UIViewController *vc = [self topViewController];
    FYBackButtonHandler handler = [vc fy_backButtonTouched];
    if (handler) {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for (UIView *subview in [navigationBar subviews]) {
            if (subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = (CGFloat) 1.;
                }];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            handler(self);
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }

    return NO;
}
@end
