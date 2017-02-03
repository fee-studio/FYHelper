//
//  FYDeviceUtil.m
//  MagicWallpaper
//
//  Created by efeng on 2016/10/18.
//  Copyright © 2016年 buerguo. All rights reserved.
//

#import "FYDeviceUtil.h"
#import "FYHelper.h"

@implementation FYDeviceUtil


+ (NSString *)fy_systemName {
    return [[UIDevice currentDevice] systemName];
}

+ (NSString *)fy_systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (float)fy_systemVersionCode {
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}


+ (BOOL)fy_isiPad {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)fy_isiPhone {
    return [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (NSString *)fy_deviceModel {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)fy_vendorUUID {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (void)fy_callTelephone:(NSString *)phoneNumber {
    // 提示：不要将webView添加到self.view，如果添加会遮挡原有的视图
    UIWebView *_webView = [[UIWebView alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", phoneNumber]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [mKeyWindow addSubview:_webView];
}

+ (void)fy_sendEmail:(NSString *)emailAddress {
//        // 1. 先判断能否发送邮件
//        if (![MFMailComposeViewController canSendMail]) {
//            // 提示用户设置邮箱
//            return;
//        }
//
//        // 2. 实例化邮件控制器，准备发送邮件
//        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
//
//        // 1) 主题 xxx的工作报告
//        [controller setSubject:@"我的工作报告"];
//        // 2) 收件人
//        [controller setToRecipients:@[@"4800607@gmail.com"]];
//
//        // 3) cc 抄送
//        // 4) bcc 密送(偷偷地告诉，打个小报告)
//        // 5) 正文
//        [controller setMessageBody:@"这是我的<font color=\"blue\">工作报告</font>，请审阅！<BR />P.S. 我的头像牛X吗？" isHTML:YES];
//
//        // 6) 附件
//        UIImage *image = [UIImage imageNamed:@"头像1.png"];
//        NSData *imageData = UIImagePNGRepresentation(image);
//        // 1> 附件的二进制数据
//        // 2> MIMEType 使用什么应用程序打开附件
//        // 3> 收件人接收时看到的文件名称
//        // 可以添加多个附件
//        [controller addAttachmentData:imageData mimeType:@"image/png" fileName:@"头像.png"];
//
//        // 7) 设置代理
//        [controller setMailComposeDelegate:self];
//
//        // 显示控制器
//        [self presentViewController:controller animated:YES completion:nil];

}

@end
