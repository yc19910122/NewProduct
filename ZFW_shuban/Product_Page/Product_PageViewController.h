//
//  Product_PageViewController.h
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-6.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Product_PageViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *ImageScroll;
    UIScrollView *smallScroll;
    NSArray *ImageArray;
    NSArray *smallArray;
    UIView *daohangView;
    float nowX;
}

@end
