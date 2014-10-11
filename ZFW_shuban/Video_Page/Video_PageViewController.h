//
//  Video_PageViewController.h
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Video_PageViewController : UIViewController<UIScrollViewDelegate,UITextViewDelegate>
{
    UIView *product;
    UIScrollView *listScr;

    NSArray *UrlArr;
    NSArray *SubjctArr;
    NSArray *PicArr;
    NSArray *Txt1Arr;
    UILabel *titleName;
    UILabel *Txt_NeiRong;
}

@end
