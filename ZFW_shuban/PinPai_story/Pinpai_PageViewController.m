//
//  Pinpai_PageViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-6.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "Pinpai_PageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface Pinpai_PageViewController ()

@end

@implementation Pinpai_PageViewController

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
    NSDictionary *dic = [ShareDate shared].storyMessage;

    NSDictionary *dic1 = [ShareDate shared].PicUrl;
    
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
    [bgimg setImageWithURL:[dic1 objectForKey:@"Pic3"] placeholderImage:nil];
    [self.view addSubview:bgimg];
    
    UIView *product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    [self.view addSubview:product];

    ppjs = [[UIView alloc]initWithFrame:CGRectMake(-602, 143, 602, 40)];
    ppjs.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jieshao.png"]];
    [product addSubview:ppjs];

    jsnr = [[UIView alloc]initWithFrame:CGRectMake(76, 190, 605, 127)];
    [jsnr setBackgroundColor:[UIColor clearColor]];
    [jsnr setAlpha:0.0f];
    [product addSubview:jsnr];

    UITextView *jieshao = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 608, 176)];
    jieshao.text = [dic objectForKey:@"Txt1"];
    [jieshao setBackgroundColor:[UIColor clearColor]];
    [jieshao setTextAlignment:NSTextAlignmentLeft];
    [jieshao setFont:[UIFont systemFontOfSize:15.0f]];
    [jieshao setDelegate:self];
    [jsnr addSubview:jieshao];

    scdw = [[UIView alloc]initWithFrame:CGRectMake(1024, 411, 608, 40)];
    scdw.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dingwei.png"]];
    [product addSubview:scdw];

    dwnr = [[UIView alloc]initWithFrame:CGRectMake(76, 456, 608, 206)];
    dwnr.backgroundColor = [UIColor clearColor];
    [dwnr setAlpha:0.0f];
    [product addSubview:dwnr];

    UITextView *jieshao1 = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, 608, 206)];
    jieshao1.text = [dic objectForKey:@"Txt2"];
    [jieshao1 setBackgroundColor:[UIColor clearColor]];
    [jieshao1 setFont:[UIFont systemFontOfSize:15.0f]];
    [jieshao1 setDelegate:self];
    [dwnr addSubview:jieshao1];

    [self donghua1];
    [self donghua2];
}

//设置不能编辑
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}

- (void)donghua1
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [ppjs setFrame:CGRectMake(76, 143, 602, 40)];
    [scdw setFrame:CGRectMake(76, 411, 608, 40)];
    [UIView commitAnimations];
}

- (void)donghua2
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.8];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [jsnr setAlpha:1.0f];
    [dwnr setAlpha:1.0f];
    [UIView commitAnimations];
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
