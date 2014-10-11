//
//  PinPai_MessageViewController.h
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinPai_MessageViewController : UIViewController<UIScrollViewDelegate,UITextViewDelegate>
{
    UIScrollView *zixun_view;
    UIView *imageView;
    NSArray *liebiao;
    UIScrollView *message_page;
    UIView *message_view;
    UIView *zhegaiView;

    UILabel *titleTxt;
    UITextView *messageTxt;
    NSArray *VideoArray;
    NSArray *picArray;

    BOOL isShow;

    UIView *Bgview;

    int what;
}

@end
