//
//  ShareDate.m
//  ZFW_hangban
//
//  Created by User #⑨ on 13-8-13.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "ShareDate.h"
#import "MBProgressHUD.h"

@implementation ShareDate
static ShareDate *ShareDataPist = nil;

@synthesize LogoUrl,PicUrl;
@synthesize storyMessage;
@synthesize ProductImage;
@synthesize Video;
@synthesize MessageImage;
@synthesize mapArray;
@synthesize LXNeiRong;
@synthesize LXMessage;

+(ShareDate *) shared{

    @synchronized(self)
    {
        if (ShareDataPist == nil)
        {
            ShareDataPist = [[self alloc] init] ;

        }
    }
    return ShareDataPist;
}

+(id) allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (ShareDataPist == nil)
        {
            ShareDataPist = [super allocWithZone:zone];
            return ShareDataPist;
        }
    }
    return nil;
}

+ (NSURL *)url_Is
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/logo.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSURL *logoURL = [NSURL URLWithString:[weatherDic objectForKey:@"getlogopicResult"]];
    return logoURL;
}

+ (NSDictionary *)ShouYe_Pic
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/index_s.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = [weatherDic objectForKey:@"getbrandappResult"];

    return dic;
}

+ (NSDictionary *)Story_NeiRong
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/brand.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = [weatherDic objectForKey:@"getbrandtxtResult"];

    return dic;
}

+ (NSArray *)MenDian_NeiRong
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/shop.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSArray *dic = [[NSArray alloc]init];
    dic = [[weatherDic objectForKey:@"getshopResult"] objectForKey:@"BrandShop"];

    return dic;
}

+ (NSArray *)Product_Image
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/product.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSArray *dic = [[NSArray alloc]init];
    dic = [[weatherDic objectForKey:@"getproductResult"] objectForKey:@"Product"];

    return dic;
}

+ (NSArray *)Message_Image
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/news.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSArray *dic = [[NSArray alloc]init];
    dic = [[weatherDic objectForKey:@"getnewsResult"] objectForKey:@"News"];

    return dic;
}

+ (NSDictionary *)Video_list
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/vedio.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = [[weatherDic objectForKey:@"getvideoResult"] objectForKey:@"Video"];

    return dic;
}

+ (NSArray *)Connection_NeiRong
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/msgtip.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSArray *dic = [[NSArray alloc]init];
    dic = [[weatherDic objectForKey:@"MsgTipResult"] objectForKey:@"string"];

    return dic;
}

+ (NSDictionary *)Connection_Message
{
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/contact.php?uid=%d",kh_UID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return nil;
    }
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = [weatherDic objectForKey:@"getBrandlxfsResult"];

    return dic;
}

+(void)showLoading{
    //    [[UIApplication sharedApplication].windows objectAtIndex:0]

    [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].windows objectAtIndex:0] animated:YES];
    //    mb.labelText=@"正在加载";
}
+(void)hideLoading{
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication].windows objectAtIndex:0] animated:YES];
    
}

@end
