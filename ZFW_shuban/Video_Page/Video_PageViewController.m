//
//  Video_PageViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "Video_PageViewController.h"
#import "Play_PageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface Video_PageViewController ()

@end

@implementation Video_PageViewController

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
    [bgimg setImageWithURL:[dic objectForKey:@"Pic2"] placeholderImage:nil];
    [self.view addSubview:bgimg];
    
    product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    product.clipsToBounds = YES;
    [self.view addSubview:product];

    UIView *title = [[UIView alloc]initWithFrame:CGRectMake(37, 30, 556, 34)];
    title.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wz.png"]];
    [product addSubview:title];

//    NSDictionary *dic1 = [ShareDate Video_list];
//    if (dic.count == 0) {
//        return;
//    }
    NSDictionary *Video_list = [ShareDate shared].Video;
    if (Video_list.count == 0) {
        return;
    }

    NSString *str = [NSString stringWithFormat:@"%@",[[Video_list objectForKey:@"Subjct"] objectAtIndex:0]];
    if ([str isEqualToString:@"(null)"] || [str isEqualToString:@"<null>"]) {
        return;
    }

    SubjctArr = [Video_list objectForKey:@"Subjct"];
    PicArr = [Video_list objectForKey:@"Pic"];
    UrlArr = [Video_list objectForKey:@"Url"];
    Txt1Arr = [Video_list objectForKey:@"Txt1"];

    listScr = [[UIScrollView alloc]initWithFrame:CGRectMake(37, 74, 768, 851)];
    listScr.delegate = self;
    listScr.backgroundColor = [UIColor clearColor];
    listScr.contentSize = CGSizeMake(150*UrlArr.count, 851);
    [product addSubview:listScr];

    for (int i = 0; i < UrlArr.count; i++) {

        UIButton *btn  = [UIButton buttonWithType:0];
        [btn setFrame:CGRectMake(0, i*124+i*20, 165, 124)];
        [btn setTag:i];
        [btn setImageWithURL:[NSURL URLWithString:[PicArr objectAtIndex:i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(PlayVideo:) forControlEvents:UIControlEventTouchUpInside];
        [listScr addSubview:btn];

        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(196, i*124+i*20, 507, 124)];
        [view setBackgroundColor:[UIColor clearColor]];
        [listScr addSubview:view];

        titleName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 507, 25)];
        titleName.backgroundColor = [UIColor clearColor];
        titleName.text = [SubjctArr objectAtIndex:i];
        titleName.font = [UIFont systemFontOfSize:20];
        [view addSubview:titleName];

        Txt_NeiRong = [[UILabel alloc]initWithFrame:CGRectMake(0, 45, 507, 50)];
        [Txt_NeiRong setFont:[UIFont systemFontOfSize:17]];
        [Txt_NeiRong setBackgroundColor:[UIColor clearColor]];
        Txt_NeiRong.text = [Txt1Arr objectAtIndex:i];
        Txt_NeiRong.numberOfLines = 0;
        [view addSubview:Txt_NeiRong];
    }
//    [self donghua];
}

//设置不能编辑
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}

- (void)PlayVideo:(UIButton *)sender
{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"rippleEffect";
    Play_PageViewController *play_page = [[Play_PageViewController alloc]init];
    play_page.Video_Name = [UrlArr objectAtIndex:sender.tag];
    play_page.tag = sender.tag;
    [self.view.superview.layer addAnimation:animation forKey:@"animation"];
    [self presentViewController:play_page animated:YES completion:Nil];
}

- (void)donghua
{
    [UIView beginAnimations:Nil context:nil];
    [UIView setAnimationDuration:1.0f];
    [product setFrame:CGRectMake(0, 85, 768, 969)];
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
