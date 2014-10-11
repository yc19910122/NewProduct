//
//  Product_PageViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-6.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "Product_PageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface Product_PageViewController ()

@end

@implementation Product_PageViewController

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
    ImageArray = [ShareDate shared].ProductImage;

    smallArray = [ShareDate shared].ProductImage;

    NSDictionary *dic = [ShareDate shared].PicUrl;
    
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
    [bgimg setImageWithURL:[dic objectForKey:@"Pic6"] placeholderImage:nil];
    [self.view addSubview:bgimg];
    
    UIView *product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    [self.view addSubview:product];

    ImageScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(158, 46, 450, 600)];
    ImageScroll.delegate = self;
    ImageScroll.tag = 0;
    ImageScroll.backgroundColor = [UIColor clearColor];
    [ImageScroll setPagingEnabled:YES];
    ImageScroll.showsHorizontalScrollIndicator = NO;
    [product addSubview:ImageScroll];

    daohangView=[[UIView alloc] initWithFrame:CGRectMake(14, 720, 738, 150)];
    daohangView.backgroundColor=[UIColor clearColor];
    [product addSubview:daohangView];
    UIView *heiView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 738, 150)];
    heiView.backgroundColor=[UIColor clearColor];
    [daohangView addSubview:heiView];

    [ImageScroll setContentSize:CGSizeMake(450*ImageArray.count, 600)];

    for (int i = 0; i < ImageArray.count; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(450*i, 0, 450, 600)];
        [img setImageWithURL:[[ImageArray objectAtIndex:i] objectForKey:@"Pic"] placeholderImage:Nil];
        [ImageScroll addSubview:img];
    }

    smallScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 738, 150)];
    smallScroll.tag = 1;
    smallScroll.delegate = self;
    smallScroll.backgroundColor = [UIColor clearColor];
    [smallScroll setShowsHorizontalScrollIndicator:NO];
    [daohangView addSubview:smallScroll];

    [smallScroll setContentSize:CGSizeMake(114*ImageArray.count+14*(ImageArray.count-1), 150)];

    for (int i = 0; i < smallArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(114*i+14*i, 0, 114, 150)];
        [btn setImageWithURL:[[smallArray objectAtIndex:i] objectForKey:@"Pic"] forState:UIControlStateNormal];
        [btn setTag:i+100];
        [btn setAlpha:0.4];
        if (i == 0) {
            btn.alpha = 1.0;
        }
        [btn addTarget:self action:@selector(changeImg:) forControlEvents:UIControlEventTouchUpInside];
        [smallScroll addSubview:btn];
    }
}

- (void)changeImg:(UIButton *)sender
{
    [ImageScroll setContentOffset:CGPointMake((sender.tag-100)*450, 0) animated:NO];
    for (int i = 0; i < smallArray.count; i++) {
        [(UIButton*)[daohangView viewWithTag:i+100] setAlpha:0.4f];
    }
    [(UIButton*)[daohangView viewWithTag:sender.tag] setAlpha:1.0f];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 0) {
        double aa=scrollView.contentOffset.x+450;
        int count= ceil(aa/450);
        if (scrollView.contentOffset.x>nowX) {
            [(UIButton*)[daohangView viewWithTag:count+99] setAlpha:1.0f];
            [(UIButton*)[daohangView viewWithTag:count+98] setAlpha:0.4f];
        }
        else{
            [(UIButton*)[daohangView viewWithTag:count+99] setAlpha:1.0f];
            [(UIButton*)[daohangView viewWithTag:count+100] setAlpha:0.4f];
        }
        nowX=scrollView.contentOffset.x;
    }
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
