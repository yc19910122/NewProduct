//
//  ViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-6.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Pinpai_PageViewController.h"
#import "Product_PageViewController.h"
#import "Video_PageViewController.h"
#import "PinPai_MessageViewController.h"
#import "PinPai_ShopViewController.h"
#import "Connection_PageViewController.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "UIImage+Antialiase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 768, 85)];
    bg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"t.png"]];
    [self.view addSubview:bg];

    UIButton *logo = [[UIButton alloc]initWithFrame:CGRectMake(329, 0, 110, 83)];
    [logo setImageWithURL:[ShareDate shared].LogoUrl forState:UIControlStateNormal];
    [bg addSubview:logo];

    UIView *product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    [product setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    [self.view addSubview:product];

    NSDictionary *dic = [ShareDate shared].PicUrl;

    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(44, 590, 310, 310)];
    [image1 setImageWithURL:[dic objectForKey:@"Pic1"] placeholderImage:nil];
    [image1 setTransform:CGAffineTransformMakeRotation(0.01745*4)];
    [image1 setUserInteractionEnabled:YES];
    [product addSubview:image1];

    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"ppzx.png"] antialiasedImage]];
    
    ppzx = [UIButton buttonWithType:UIButtonTypeCustom];
    [ppzx setAlpha:0.0];
    [ppzx setFrame:CGRectMake(-2, -2, 314, 314)];
    //    [ppzx setImageWithURL:[dic objectForKey:@"Pic1"] forState:UIControlStateNormal];
    [ppzx setImage:imageView1.image forState:UIControlStateNormal];
    //    [ppzx setTransform:CGAffineTransformMakeRotation(0.01745*4)];
    [ppzx setTag:3];
    [ppzx addTarget:self action:@selector(GoStory:) forControlEvents:UIControlEventTouchUpInside];
    [image1 addSubview:ppzx];

    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(56, 305, 310, 310)];
    [image2 setImageWithURL:[dic objectForKey:@"Pic2"] placeholderImage:nil];
    [image2 setTransform:CGAffineTransformMakeRotation(-0.01745*2)];
    [image2 setUserInteractionEnabled:YES];
    [product addSubview:image2];

    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"spxc.png"] antialiasedImage]];
    
    spxc = [UIButton buttonWithType:UIButtonTypeCustom];
    [spxc setAlpha:0.0f];
    [spxc setFrame:CGRectMake(-2, -2, 314, 314)];
    //    [spxc setImageWithURL:[dic objectForKey:@"Pic2"] forState:UIControlStateNormal];
    [spxc setImage:imageView2.image forState:UIControlStateNormal];
    //    [spxc setTransform:CGAffineTransformMakeRotation(-0.01745*2)];
    [spxc setTag:2];
    [spxc addTarget:self action:@selector(GoStory:) forControlEvents:UIControlEventTouchUpInside];
    [image2 addSubview:spxc];
    
    UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake(74, 15, 310, 310)];
    [image3 setImageWithURL:[dic objectForKey:@"Pic3"] placeholderImage:nil];
    [image3 setTransform:CGAffineTransformMakeRotation(0.01745*3)];
    [image3 setUserInteractionEnabled:YES];
    [product addSubview:image3];

    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"ppgs.png"] antialiasedImage]];
    
    ppgs = [UIButton buttonWithType:UIButtonTypeCustom];
    [ppgs setAlpha:0.0f];
    [ppgs setFrame:CGRectMake(-2, -2, 314, 314)];
    //    [ppgs setImageWithURL:[dic objectForKey:@"Pic3"] forState:UIControlStateNormal];
    [ppgs setImage:imageView3.image forState:UIControlStateNormal];
    //    [ppgs setTransform:CGAffineTransformMakeRotation(0.01745*3)];
    [ppgs setTag:0];
    [ppgs addTarget:self action:@selector(GoStory:) forControlEvents:UIControlEventTouchUpInside];
    [image3 addSubview:ppgs];
    
    UIImageView *image4 = [[UIImageView alloc]initWithFrame:CGRectMake(388, 595, 310, 310)];
    [image4 setImageWithURL:[dic objectForKey:@"Pic4"] placeholderImage:nil];
    [image4 setTransform:CGAffineTransformMakeRotation(-0.01745*2)];
    [image4 setUserInteractionEnabled:YES];
    [product addSubview:image4];

    UIImageView *imageView4 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"lxwm.png"] antialiasedImage]];
    
    lxwm = [UIButton buttonWithType:UIButtonTypeCustom];
    [lxwm setAlpha:0.0f];
    [lxwm setFrame:CGRectMake(-2, -2, 314, 314)];
    //    [lxwm setImageWithURL:[dic objectForKey:@"Pic4"] forState:UIControlStateNormal];
    [lxwm setImage:imageView4.image forState:UIControlStateNormal];
    //    [lxwm setTransform:CGAffineTransformMakeRotation(-0.01745*2)];
    [lxwm setTag:5];
    [lxwm addTarget:self action:@selector(GoStory:) forControlEvents:UIControlEventTouchUpInside];
    [image4 addSubview:lxwm];
    
    UIImageView *image5 = [[UIImageView alloc]initWithFrame:CGRectMake(392, 305, 310, 310)];
    [image5 setImageWithURL:[dic objectForKey:@"Pic5"] placeholderImage:nil];
    [image5 setTransform:CGAffineTransformMakeRotation(0.01745*4)];
    [image5 setUserInteractionEnabled:YES];
    [product addSubview:image5];

    UIImageView *imageView5 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"ppmd.png"] antialiasedImage]];
    
    ppmd = [UIButton buttonWithType:UIButtonTypeCustom];
    [ppmd setAlpha:0.0f];
    [ppmd setFrame:CGRectMake(-2, -2, 314, 314)];
    //    [ppmd setImageWithURL:[dic objectForKey:@"Pic5"] forState:UIControlStateNormal];
    [ppmd setImage:imageView5.image forState:UIControlStateNormal];
    //    [ppmd setTransform:CGAffineTransformMakeRotation(0.01745*4)];
    [ppmd setTag:4];
    [ppmd addTarget:self action:@selector(GoStory:) forControlEvents:UIControlEventTouchUpInside];
    [image5 addSubview:ppmd];
    
    UIImageView *image6 = [[UIImageView alloc]initWithFrame:CGRectMake(392, 15, 310, 310)];
    [image6 setImageWithURL:[dic objectForKey:@"Pic6"] placeholderImage:nil];
    image6.image = [image6.image antialiasedImage];
    [image6 setTransform:CGAffineTransformMakeRotation(-0.01745*4)];
    [image6 setUserInteractionEnabled:YES];
    [product addSubview:image6];

    UIImageView *imageView6 = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"cpzs.png"] antialiasedImage]];
    
    cczs = [UIButton buttonWithType:UIButtonTypeCustom];
    [cczs setAlpha:0.0f];
    [cczs setFrame:CGRectMake(-2, -2, 314, 314)];
    //    [cczs setImageWithURL:[dic objectForKey:@"Pic6"] forState:UIControlStateNormal];
//    [cczs setImage:[UIImage imageNamed:@"cpzs"] forState:UIControlStateNormal];
    [cczs setImage:imageView6.image forState:UIControlStateNormal];
    //    [cczs setTransform:CGAffineTransformMakeRotation(-0.01745*4)];
    [cczs setTag:1];
    [cczs addTarget:self action:@selector(GoStory:) forControlEvents:UIControlEventTouchUpInside];
    [image6 addSubview:cczs];

    [self donghua1];
    [self donghua2];
}

- (void)donghua1
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    [ppgs setAlpha:1.0f];
    [ppmd setAlpha:1.0f];
    [ppzx setAlpha:1.0f];
    [UIView commitAnimations];
}

- (void)donghua2
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8f];
    [spxc setAlpha:1.0f];
    [cczs setAlpha:1.0f];
    [lxwm setAlpha:1.0f];
    [UIView commitAnimations];
}

- (void)GoStory:(UIButton *)sender
{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"rippleEffect";
    switch (sender.tag) {
        case 0:
        {
            Pinpai_PageViewController *pinpai_page = [[Pinpai_PageViewController alloc]init];
            [self.view.superview.layer addAnimation:animation forKey:@"animation"];
            [self presentViewController:pinpai_page animated:NO completion:Nil];
        }
            break;
        case 1:
        {
            Product_PageViewController *product_page = [[Product_PageViewController alloc]init];
            [self.view.superview.layer addAnimation:animation forKey:@"animation"];
            [self presentViewController:product_page animated:NO completion:Nil];
        }
            break;
        case 2:
        {
            Video_PageViewController *video_page = [[Video_PageViewController alloc]init];
            [self.view.superview.layer addAnimation:animation forKey:@"animation"];
            [self presentViewController:video_page animated:NO completion:Nil];
        }
            break;
        case 3:
        {
            PinPai_MessageViewController *pinpai_message = [[PinPai_MessageViewController alloc]init];
            [self.view.superview.layer addAnimation:animation forKey:@"animation"];
            [self presentViewController:pinpai_message animated:NO completion:Nil];
        }
            break;
        case 4:
        {
            PinPai_ShopViewController *pinpai_shop = [[PinPai_ShopViewController alloc]init];
            [self.view.superview.layer addAnimation:animation forKey:@"animation"];
            [self presentViewController:pinpai_shop animated:NO completion:Nil];
        }
            break;
        case 5:
        {
            Connection_PageViewController *connection_page = [[Connection_PageViewController alloc]init];
            [self.view.superview.layer addAnimation:animation forKey:@"animation"];
            [self presentViewController:connection_page animated:NO completion:Nil];
        }
            break;

        default:
            break;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
