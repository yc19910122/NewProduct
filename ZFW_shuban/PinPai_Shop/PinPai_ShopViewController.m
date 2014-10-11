//
//  PinPai_ShopViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "PinPai_ShopViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "Map.h"

@interface PinPai_ShopViewController ()

@end

@implementation PinPai_ShopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSDictionary *dic22 = [ShareDate shared].PicUrl;
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 768, 85)];
    bg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"t.png"]];
    [self.view addSubview:bg];

    UIButton *logo = [[UIButton alloc]initWithFrame:CGRectMake(329, 0, 110, 83)];
    [logo setImageWithURL:[ShareDate shared].LogoUrl forState:UIControlStateNormal];
    [logo addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:logo];

    UIButton *backbtn = [UIButton buttonWithType:0];
    [backbtn setFrame:CGRectMake(60, 25, 44, 41)];
    [backbtn setImage:[UIImage imageNamed:@"fanghui.png"] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [bg addSubview:backbtn];
    
    UIImageView *bgimg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    [bgimg setImageWithURL:[dic22 objectForKey:@"Pic5"] placeholderImage:nil];
    [self.view addSubview:bgimg];
    
    product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    [self.view addSubview:product];

    UIView *title = [[UIView alloc]initWithFrame:CGRectMake(13, 10, 55, 188)];
    [title setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mc.png"]]];
    [product addSubview:title];

    dic = [ShareDate shared].mapArray;

    local = [[UIScrollView alloc]initWithFrame:CGRectMake(68, 0, 700, 211)];
    [local setDelegate:self];
    [local setBackgroundColor:[UIColor clearColor]];
    [local setUserInteractionEnabled:YES];
    [product addSubview:local];
    [local setContentSize:CGSizeMake(227*dic.count, 211)];

    if ([[NSString stringWithFormat:@"%@",[dic objectAtIndex:0]] isEqualToString:@"<null>"]) {
        return;
    }
    for (int i = 1; i <= dic.count; i++) {
        view = [[UIImageView alloc]initWithFrame:CGRectMake(32*(i-1)+195*(i-1), 20, 195, 188)];
        [view setBackgroundColor:[UIColor clearColor]];
        [view setUserInteractionEnabled:YES];
        [local addSubview:view];

        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 172, 20)];
        [name setBackgroundColor:[UIColor clearColor]];
        NSString *str = @"0";
        if (i < 10) {
            str = [NSString stringWithFormat:@"0%d  %@",i,[[dic objectAtIndex:(i-1)] objectForKey:@"Shopname"]];
        }else
            str = [NSString stringWithFormat:@"%d  %@",i,[[dic objectAtIndex:(i-1)] objectForKey:@"Shopname"]];
        name.text = str;
        [name setFont:[UIFont systemFontOfSize:15.0f]];
        [view addSubview:name];

        UILabel *address = [[UILabel alloc]initWithFrame:CGRectMake(0, 32, 172, 20)];
        [address setBackgroundColor:[UIColor clearColor]];
        address.text = @"地   址:";
        [address setFont:[UIFont systemFontOfSize:15.0f]];
        [view addSubview:address];

        UILabel *add = [[UILabel alloc]initWithFrame:CGRectMake(0, 57, 172, 57)];
        [add setBackgroundColor:[UIColor clearColor]];
        add.text = [NSString stringWithFormat:@"%@",[[dic objectAtIndex:(i-1)] objectForKey:@"Addr"]];
        [add setNumberOfLines:0];
        [add setFont:[UIFont systemFontOfSize:15.0f]];
        [view addSubview:add];

        UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(0, 117, 172, 20)];
        phone.text = @"联系电话:";
        [phone setFont:[UIFont systemFontOfSize:15.0f]];
        [phone setBackgroundColor:[UIColor clearColor]];
        [view addSubview:phone];

        UILabel *pho_num = [[UILabel alloc]initWithFrame:CGRectMake(0, 145, 172, 20)];
        pho_num.text = [NSString stringWithFormat:@"%@",[[dic objectAtIndex:(i-1)] objectForKey:@"Tel"]];
        [pho_num setBackgroundColor:[UIColor clearColor]];
        [pho_num setFont:[UIFont systemFontOfSize:15.0f]];
        [view addSubview:pho_num];

        UIButton *btn = [UIButton buttonWithType:0];
        [btn setFrame:CGRectMake(32*(i-1)+195*(i-1), 10, 195, 188)];
        [btn addTarget:self action:@selector(PassBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:(i-1)];
        [local addSubview:btn];
    }

    MDName = [[dic objectAtIndex:0] objectForKey:@"Shopname"];
    MDaddress = [[dic objectAtIndex:0] objectForKey:@"Addr"];
    double Gpsx = [[[dic objectAtIndex:0] objectForKey:@"Gpsx"] doubleValue];
    double Gpsy = [[[dic objectAtIndex:0] objectForKey:@"Gpsy"] doubleValue];
    [self setMapX:Gpsx Y:Gpsy];
}

- (void)PassBtn:(UIButton *)sender
{
    MDName = [[dic objectAtIndex:sender.tag] objectForKey:@"Shopname"];
    MDaddress = [[dic objectAtIndex:sender.tag] objectForKey:@"Addr"];
    double Gpsx = [[[dic objectAtIndex:sender.tag] objectForKey:@"Gpsx"] doubleValue];
    double Gpsy = [[[dic objectAtIndex:sender.tag] objectForKey:@"Gpsy"] doubleValue];
    [self setMapX:Gpsx Y:Gpsy];
}

- (void)setMapX:(double)lon Y:(double )lat
{
    [map removeFromSuperview];

    map = [[MKMapView alloc]initWithFrame:CGRectMake(0, 210, 768, 728)];
    map.showsUserLocation = YES;
    map.mapType = MKMapTypeStandard;
    [product addSubview:map];

    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(lon,lat);

    float zoomLevel = 0.02;
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [map setRegion:[map regionThatFits:region] animated:YES];

    [self createAnnotationWithCoords:coords];
}

-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) coords {
    Map *annotation = [[Map alloc] initWithCoordinate:
                       coords];
    annotation.title = MDName;
    annotation.subtitle = MDaddress;
    [map addAnnotation:annotation];
}

- (void)back
{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"rippleEffect";
    [self.view.superview.layer addAnimation:animation forKey:@"animation"];
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
