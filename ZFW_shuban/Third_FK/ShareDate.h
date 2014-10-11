//
//  ShareDate.h
//  ZFW_hangban
//
//  Created by User #⑨ on 13-8-13.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareDate : NSObject

+ (ShareDate *) shared;
+ (id) allocWithZone:(NSZone *)zone;
+ (NSURL *)url_Is;
+ (NSDictionary *)ShouYe_Pic;
+ (NSDictionary *)Story_NeiRong;
+ (NSArray *)MenDian_NeiRong;
+ (NSArray *)Product_Image;
+ (NSArray *)Message_Image;
+ (NSDictionary *)Video_list;
+ (NSArray *)Connection_NeiRong;
+ (NSDictionary *)Connection_Message;
+(void)showLoading;
+(void)hideLoading;

@property (strong, nonatomic) NSURL *LogoUrl;
@property (strong, nonatomic) NSDictionary *PicUrl;
@property (strong, nonatomic) NSDictionary *storyMessage;
@property (strong, nonatomic) NSArray *ProductImage;
@property (strong, nonatomic) NSDictionary *Video;
@property (strong, nonatomic) NSArray *MessageImage;
@property (strong, nonatomic) NSArray *mapArray;
@property (strong, nonatomic) NSArray *LXNeiRong;
@property (strong, nonatomic) NSDictionary *LXMessage;
@end
