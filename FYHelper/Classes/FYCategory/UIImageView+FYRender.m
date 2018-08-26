//
// Created by fengyiyi on 2018/8/19.
//

#import "UIImageView+FYRender.h"


@implementation UIImageView (FYRender)

+ (UIImageView *)fy_imageViewRenderWithImage:(UIImage *)image tintColor:(UIColor *)color {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tintColor = color;
    UIImage *imageRender = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    imageView.image = imageRender;
    return imageView;
}

@end