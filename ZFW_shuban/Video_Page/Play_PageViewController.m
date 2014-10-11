//
//  Play_PageViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "Play_PageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface Play_PageViewController ()

@end

@implementation Play_PageViewController
@synthesize Video_Name;
@synthesize tag;

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
    
    UIView *product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    [self.view addSubview:product];

    play = [[MPMoviePlayerController alloc]init];
    [play.view setFrame:CGRectMake(13, 19, 743, 558)];
    [play setControlStyle:MPMovieControlModeVolumeOnly];
    [play setFullscreen:YES animated:YES];
    play.repeatMode = MPMovieRepeatModeOne;
    [play setInitialPlaybackTime:0.0];
    play.scalingMode = MPMovieScalingModeAspectFit;
//    play.backgroundView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"SPBJ.png"]];
    [product addSubview:play.view];

//    NSString *path = [[NSBundle mainBundle] pathForResource:Video_Name ofType:@".mp4"];
//    NSURL* url=[NSURL fileURLWithPath:path];
    NSURL *url = [NSURL URLWithString:Video_Name];
    [play setContentURL:url];
    [play.view setHidden:NO];
    [play play];

//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(13, 610, 733, 299)];
//    imageView.image = [UIImage imageNamed:@"s.png"];
//    [product addSubview:imageView];

    NSDictionary *dic1 = [ShareDate shared].Video;
    NSArray *SubjctArr = [dic1 objectForKey:@"Subjct"];
    NSArray *Txt1Arr = [dic1 objectForKey:@"Txt1"];
    
    UIView *neirongView = [[UIView alloc]initWithFrame:CGRectMake(13, 610, 733, 299)];
    [neirongView setBackgroundColor:[UIColor clearColor]];
    [product addSubview:neirongView];

    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 733, 40)];
    title.text = [SubjctArr objectAtIndex:tag];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont systemFontOfSize:24];
    [neirongView addSubview:title];

    UITextView *text = [[UITextView alloc]initWithFrame:CGRectMake(0, 50, 733, 180)];
    text.delegate = self;
    text.font = [UIFont systemFontOfSize:20];
    text.text = [Txt1Arr objectAtIndex:tag];
    text.backgroundColor = [UIColor clearColor];
    [neirongView addSubview:text];
}

- (void)back
{
    [play stop];
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
