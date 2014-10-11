//
//  Connection_PageViewController.h
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-8.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Connection_PageViewController : UIViewController<UIAlertViewDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UITextFieldDelegate>
{
    UIButton *send;

    UIScrollView *scrollView;

    NSArray *msgArray;
    NSDictionary *msgDic;

    UITextView *zxnr;

    UITextField *address;
    UITextField *your_name;
    UITextField *your_tele;
    UITextField *mail;

    NSMutableData*_appListData;
    NSURLConnection *_appListFeedConnection;

    UITableView *TJMsg;

    UIView *zixunneirong;
}

@property(nonatomic,retain) NSMutableData*appListData;
@property(nonatomic,retain) NSURLConnection*appListFeedConnection;
@end
