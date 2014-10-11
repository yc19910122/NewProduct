//
//  PinPai_MessageViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "PinPai_MessageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface PinPai_MessageViewController ()

@end

@implementation PinPai_MessageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [Bgview removeFromSuperview];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    isShow = YES;
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
    [bgimg setImageWithURL:[dic objectForKey:@"Pic1"] placeholderImage:nil];
    [self.view addSubview:bgimg];
    
    UIView *product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    [self.view addSubview:product];

    liebiao= [[NSArray alloc]initWithObjects:@"4.1.1.png",@"4.2.2.png",@"4.3.3.png",@"4.2.2.png",@"4.1.1.png", nil];
    
    zixun_view = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024-85)];
    zixun_view.delegate = self;
    [zixun_view setContentSize:CGSizeMake(768, 603*2)];
    [zixun_view setBackgroundColor:[UIColor clearColor]];
    [zixun_view setUserInteractionEnabled:YES];
    [product addSubview:zixun_view];
    
    //642 × 784
    message_view = [[UIView alloc]initWithFrame:CGRectMake(768, 0, 768, 939)];
    [message_view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"baise.png"]]];
    [product addSubview:message_view];
    
//    message_page = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 642, 784)];
//    [message_page setBackgroundColor:[UIColor clearColor]];
//    [message_page setUserInteractionEnabled:YES];
//    [message_page setContentSize:CGSizeMake(642, 784)];
//    [message_page setBounces:NO];
//    [message_view addSubview:message_page];
//
//    UIView *neirongView = [[UIView alloc]initWithFrame:CGRectMake(56, 0, 642, 784)];
//    [neirongView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"zixun.png"]]];
//    [message_page addSubview:neirongView];
//
//    UISwipeGestureRecognizer *recognizer;
//    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//    [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
//    [message_page addGestureRecognizer:recognizer];

    VideoArray = [ShareDate shared].MessageImage;

    [self drawScroll];
}

- (void)tapAction:(UITapGestureRecognizer *)touch
{
    isShow = YES;
    [zixun_view setContentOffset:CGPointMake(0, zixun_view.contentOffset.y) animated:YES];
    [zixun_view setScrollEnabled:YES];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [message_view setFrame:CGRectMake(768, 0, 768, 939)];
    [UIView commitAnimations];
}

- (void)drawScroll
{
    NSString *isnul = [NSString stringWithFormat:@"%@",[VideoArray objectAtIndex:0]];
    if ([isnul isEqualToString:@"<null>"]) {
        return;
    }
    for (int i = 0; i < VideoArray.count; i++) {
        if (i%2 == 0) {
            imageView = [[UIView alloc]initWithFrame:CGRectMake(88, 37 + i*200, 591, 144)];
            imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"KZ.png"]];
        }
        if (i%2 == 1) {
            imageView = [[UIView alloc]initWithFrame:CGRectMake(128, 238 + (i-1)*200, 591, 144)];
            imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"KY.png"]];
        }
        if (i%2 == 0) {
            UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 25, 445, 26)];
            title.text = [[VideoArray objectAtIndex:i] objectForKey:@"Subjct"];
            title.font = [UIFont systemFontOfSize:18.0f];
            title.backgroundColor = [UIColor clearColor];
            [imageView addSubview:title];

            UILabel *txt = [[UILabel alloc]initWithFrame:CGRectMake(20, 60, 450, 58)];
            txt.text = [[VideoArray objectAtIndex:i] objectForKey:@"Txt1"];
            txt.font = [UIFont systemFontOfSize:15.0f];
            txt.numberOfLines = 0;
            txt.backgroundColor = [UIColor clearColor];
            [imageView addSubview:txt];

            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(475, 60, 60, 60)];
            image.backgroundColor = [UIColor clearColor];
            NSURL *url = [NSURL URLWithString:[[VideoArray objectAtIndex:i] objectForKey:@"Pic"]];
            [image setImageWithURL:url placeholderImage:nil];
            [imageView addSubview:image];
        }else
        {
            UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(57, 25, 445, 26)];
            title.text = [[VideoArray objectAtIndex:i] objectForKey:@"Subjct"];
            title.font = [UIFont systemFontOfSize:18.0f];
            title.backgroundColor = [UIColor clearColor];
            [imageView addSubview:title];

            UILabel *txt = [[UILabel alloc]initWithFrame:CGRectMake(57, 60, 450, 58)];
            txt.text = [[VideoArray objectAtIndex:i] objectForKey:@"Txt1"];
            txt.font = [UIFont systemFontOfSize:15.0f];
            txt.numberOfLines = 0;
            txt.backgroundColor = [UIColor clearColor];
            [imageView addSubview:txt];

            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(515, 63, 60, 60)];
            image.backgroundColor = [UIColor clearColor];
            NSURL *url = [NSURL URLWithString:[[VideoArray objectAtIndex:i] objectForKey:@"Pic"]];
            [image setImageWithURL:url placeholderImage:nil];
            [imageView addSubview:image];
        }


        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(0, 0, 591, 144)];
        [btn setTag:i];
        [btn addTarget:self action:@selector(Show:) forControlEvents:UIControlEventTouchUpInside];
        [imageView addSubview:btn];

        [zixun_view addSubview:imageView];
    }
    int pagenum;
    if (VideoArray.count != 0) {
        if ((VideoArray.count%3 == 0)) {
            pagenum = VideoArray.count/3;
        }else
            pagenum = VideoArray.count/3+1;
    }else
        pagenum = 1;

    [zixun_view setContentSize:CGSizeMake(768, 603*pagenum)];
}

- (void)Show:(UIButton *)sender
{
    isShow = NO;
    NSString *ID = [[VideoArray objectAtIndex:sender.tag] objectForKey:@"Id"];
    NSString *str = [NSString stringWithFormat:@"http://app.efu.com.cn/zhongfuapi/newsdata.php?id=%@",ID];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    NSURLResponse *urlResponce=nil;
    NSError *error=nil;
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponce error:&error];
    if (error) {
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用,请稍后再试" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alter show];
        return;
    }
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = [weatherDic objectForKey:@"getnewsdataResult"];

    [message_page removeFromSuperview];

    message_page = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 768, 847)];
    [message_page setBackgroundColor:[UIColor clearColor]];
    [message_page setUserInteractionEnabled:YES];
    [message_view addSubview:message_page];

    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [recognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [message_page addGestureRecognizer:recognizer];

    messageTxt = [[UITextView alloc]initWithFrame:CGRectMake(50, 80, 668, 360)];
    messageTxt.backgroundColor = [UIColor clearColor];
    messageTxt.delegate = self;
    messageTxt.font = [UIFont systemFontOfSize:18];
    [message_page addSubview:messageTxt];

    titleTxt = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 668, 70)];
    titleTxt.backgroundColor = [UIColor clearColor];
    titleTxt.font = [UIFont systemFontOfSize:22];
    titleTxt.textAlignment = NSTextAlignmentCenter;
    titleTxt.numberOfLines = 0;
    [message_page addSubview:titleTxt];

    titleTxt.text = [dic objectForKey:@"Title"];
    messageTxt.text = [dic objectForKey:@"Txt1"];
    picArray = [dic objectForKey:@"imgs"];
    int hangshu;
    if (picArray.count%2 != 0) {
        hangshu = picArray.count/2+1;
    }else
        hangshu = picArray.count/2;

    int flag = 0;
    for (int i = 0; i < hangshu; i++) {
        for (int j = 0; j < 2; j++) {
            if (flag >= picArray.count) {
                break;
            }
            UIButton *littlePic = [UIButton buttonWithType:UIButtonTypeCustom];
            if (j != 0) {
                [littlePic setFrame:CGRectMake(130+75*j+225*j, 460+320*i, 225, 300)];
            }else
                [littlePic setFrame:CGRectMake(130+75*j+225*j, 460+320*i, 225, 300)];

//            [littlePic setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[picArray objectAtIndex:flag]]] placeholderImage:Nil];
            [littlePic setTag:flag];
            [littlePic setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[picArray objectAtIndex:flag]]] forState:UIControlStateNormal];
            [littlePic addTarget:self action:@selector(Fangda:) forControlEvents:UIControlEventTouchUpInside];
            [message_page addSubview:littlePic];
            NSLog(@"%@",[picArray objectAtIndex:flag]);
            flag++;
            NSLog(@"%d",flag);
        }
    }
    [message_page setContentOffset:CGPointMake(0, 0)];
    [message_page setContentSize:CGSizeMake(642,460+hangshu*320)];
    
    [zixun_view setContentOffset:CGPointMake(120, zixun_view.contentOffset.y) animated:YES];
    [zixun_view setScrollEnabled:NO];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [message_view setFrame:CGRectMake(0, 0, 768, 939)];
    [UIView commitAnimations];

}

- (void)Fangda:(UIButton *)sender
{
    [ShareDate showLoading];
    what = sender.tag;
    [self performSelector:@selector(Showpic) withObject:self afterDelay:0];
}

- (void)Showpic
{
    NSString *url = [NSString stringWithFormat:@"%@",[picArray objectAtIndex:what]];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:data];
    NSLog(@"%f,%f",image.size.width,image.size.height);

    Bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 768, 939)];
    Bgview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bigview.png"]];
    [message_view addSubview:Bgview];

    UIImageView *bigImage = [[UIImageView alloc]init];
    if (image.size.width > 768) {
        [bigImage setFrame:CGRectMake(0, (939-image.size.height)/2, 768, image.size.width/768*image.size.height)];
        [bigImage setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    }else
    {
        [bigImage setFrame:CGRectMake((768-image.size.width)/2, (939-image.size.height)/2, image.size.width, image.size.height)];
        [bigImage setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    }
    [Bgview addSubview:bigImage];
    [ShareDate hideLoading];
}

//设置不能编辑
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    return NO;
}

- (void)back
{
    if (isShow == YES) {
        CATransition *animation = [CATransition animation];
        animation.delegate = self;
        animation.duration = kDuration;
        animation.timingFunction = UIViewAnimationCurveEaseInOut;
        animation.type = @"rippleEffect";
        [self.view.superview.layer addAnimation:animation forKey:@"animation"];
        [self dismissViewControllerAnimated:YES completion:Nil];
    }else
    {
        [zixun_view setContentOffset:CGPointMake(0, zixun_view.contentOffset.y) animated:YES];
        [zixun_view setScrollEnabled:YES];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [message_view setFrame:CGRectMake(768, 0, 768, 939)];
        [UIView commitAnimations];
        isShow = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
