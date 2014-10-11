//
//  AppDelegate.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-6.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([ShareDate url_Is] == nil) {
        NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:[self dataFilePath]];

        [ShareDate shared].LogoUrl = [dic objectForKey:@"LogoUrl"];
        [ShareDate shared].PicUrl = [dic objectForKey:@"PicUrl"];
        [ShareDate shared].storyMessage = [dic objectForKey:@"storyMessage"];
        [ShareDate shared].ProductImage = [dic objectForKey:@"ProductImage"];
        [ShareDate shared].Video = [dic objectForKey:@"Video"];
        [ShareDate shared].MessageImage = [dic objectForKey:@"MessageImage"];
        [ShareDate shared].mapArray = [dic objectForKey:@"mapArray"];
        [ShareDate shared].LXNeiRong = [dic objectForKey:@"LXNeiRong"];
        [ShareDate shared].LXMessage = [dic objectForKey:@"LXMessage"];
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络没有链接，进入离线模式，可能会有部分图片显示不出，新闻咨询页面中的每条新闻不能阅读，若想完全显示，请链接网络后重试!!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alt show];
    }else
    {
        [ShareDate shared].LogoUrl = [ShareDate url_Is];
        [ShareDate shared].PicUrl = [ShareDate ShouYe_Pic];
        [ShareDate shared].storyMessage = [ShareDate Story_NeiRong];
        [ShareDate shared].ProductImage = [ShareDate Product_Image];
        [ShareDate shared].Video = [ShareDate Video_list];
        [ShareDate shared].MessageImage = [ShareDate Message_Image];
        [ShareDate shared].mapArray = [ShareDate MenDian_NeiRong];
        [ShareDate shared].LXNeiRong = [ShareDate Connection_NeiRong];
        [ShareDate shared].LXMessage = [ShareDate Connection_Message];

        NSString *urlString=[NSString stringWithFormat:@"%@",[ShareDate shared].LogoUrl];
        NSString *picUrl=[NSString stringWithFormat:@"%@",[ShareDate shared].PicUrl];
        NSDictionary *dicssss=[[NSDictionary alloc]initWithObjectsAndKeys:urlString, @"LogoUrl",picUrl,@"PicUrl",[ShareDate shared].storyMessage,@"storyMessage",[ShareDate shared].ProductImage,@"ProductImage",[ShareDate shared].Video,@"Video",[ShareDate shared].MessageImage,@"MessageImage",[ShareDate shared].mapArray,@"mapArray",[ShareDate shared].LXNeiRong,@"LXNeiRong",[ShareDate shared].LXMessage,@"LXMessage",nil];

        NSFileManager  *fmssss = [NSFileManager defaultManager];
        [fmssss createFileAtPath:[self dataFilePath] contents:nil attributes:nil];
        [dicssss writeToFile:[self dataFilePath] atomically:YES];
    }

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (NSString *)dataFilePath {
    //写入library
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileNamepath=[path stringByAppendingPathComponent:@"data.plist"];
    return fileNamepath;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
