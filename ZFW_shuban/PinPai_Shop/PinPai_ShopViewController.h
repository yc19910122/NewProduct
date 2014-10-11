//
//  PinPai_ShopViewController.h
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface PinPai_ShopViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *local;
    UIView *product;

    MKMapView *map;
    NSString *MDName;
    NSString *MDaddress;

    UIImageView *view;

    NSArray *dic;
}

@end
