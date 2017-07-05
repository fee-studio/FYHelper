# FYHelper -- App快速构建框架

#### 文件夹分类说明
```
【FYCategory】收集的一些常用的便捷方法，方便快速开发
【FYInstall】 常用第三方库的安装器
【FYSubclass】收集的UI控件子类
【FYUtil】    常用的一些工具类
【FYUIKit】   对基础UIKit控件的封装，集成一些基础的常用的必备的功能
```
#### 支持的功能
1，支持[Bugly](http://bugly.qq.com)
```
用法：
[Bugly fy_setupWithAppId:@"xxxxxx"]; // xxxxxx你在bugly.qq.com申请的app id.

// Bulgy的打印Log的方法
BLYLogError(fmt, ...)
BLYLogWarn(fmt, ...)
BLYLogInfo(fmt, ...)
BLYLogDebug(fmt, ...)
BLYLogVerbose(fmt, ...)

void BLYLog(BuglyLogLevel level, NSString *format, ...);
void BLYLogv(BuglyLogLevel level, NSString *format, va_list args);
```
2，支持[DDLog](https://github.com/CocoaLumberjack/CocoaLumberjack)，一个强大的log系统
```
用法：
// Convert from this:
NSLog(@"Broken sprocket detected!");
NSLog(@"User selected file:%@ withSize:%u", filePath, fileSize);
// To this:
DDLogError(@"Broken sprocket detected!");
DDLogVerbose(@"User selected file:%@ withSize:%u", filePath, fileSize);
```
3，支持[AFNetworking](https://github.com/AFNetworking/AFNetworking)，这个大家应该都知道吧
>
4，支持[FLEX](https://github.com/Flipboard/FLEX)，一个调试UI的框架
>
5，支持[FMDB](https://github.com/ccgus/fmdb)，数据库的处理
>

6，支持[Instabug](https://dashboard.instabug.com/profile/)，一个用户反馈的系统
>
7，支持[KVOController](https://github.com/facebook/KVOController)
>
8，支持UIScrollView及其子类没数据是显示一些提示，使用的是[DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)
>
9，支持[Masonry](https://github.com/SnapKit/Masonry)，简单好写的Autolayout哦
>
10，支持[pop](https://github.com/facebook/pop)，一个很好用的动画库
>
11，支持版本的更新，使用的是[iVersion](https://github.com/nicklockwood/iVersion)
>
12，点击UIScrollView的空白处收回键盘。
>