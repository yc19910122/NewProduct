//
//  Connection_PageViewController.m
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-8.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import "Connection_PageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@interface Connection_PageViewController ()

@end

@implementation Connection_PageViewController
@synthesize appListData=_appListData;
@synthesize appListFeedConnection = _appListFeedConnection;

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
    [zxnr resignFirstResponder];
    [address resignFirstResponder];
    [your_name resignFirstResponder];
    [your_tele resignFirstResponder];
    [mail resignFirstResponder];
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
    [bgimg setImageWithURL:[dic objectForKey:@"Pic4"] placeholderImage:nil];
    [self.view addSubview:bgimg];
    
    UIView *product = [[UIView alloc]initWithFrame:CGRectMake(0, 85, 768, 969)];
    product.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tdc.png"]];
    product.clipsToBounds = YES;
    [self.view addSubview:product];

    msgArray = [ShareDate shared].LXNeiRong;
    msgDic = [ShareDate shared].LXMessage;
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(100, 324, 768, 969)];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.userInteractionEnabled = YES;
    scrollView.delegate=self;
    [scrollView setCanCancelContentTouches:YES];
    [scrollView setDelaysContentTouches:YES];
    scrollView.clipsToBounds = YES;
    [product addSubview:scrollView];

    UITapGestureRecognizer *tapRecognizer =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [scrollView addGestureRecognizer:tapRecognizer];
    
    UIView *lyView = [[UIView alloc]initWithFrame:CGRectMake(55, 38+85, 335, 275)];
    [lyView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:lyView];
    
    UIImageView *kjly = [[UIImageView alloc]initWithFrame:CGRectMake(25, 0, 190, 59)];//45
    kjly.image = [UIImage imageNamed:@"kjly.png"];
    [lyView addSubview:kjly];

    TJMsg = [[UITableView alloc]initWithFrame:CGRectMake(0, 65, 350, 210)];
    [TJMsg setBackgroundColor:[UIColor clearColor]];
    TJMsg.dataSource = self;
    TJMsg.delegate = self;
    TJMsg.separatorStyle = UITableViewCellSeparatorStyleNone;
    [lyView addSubview:TJMsg];
    
    UIView *xxView = [[UIView alloc]initWithFrame:CGRectMake(400, 45+85, 306, 220)];
    [xxView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:xxView];

    UIImageView *gsxx = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 75, 23)];//420
    gsxx.image = [UIImage imageNamed:@"gsxx.png"];
    [xxView addSubview:gsxx];

    for (int i = 0; i < msgDic.count-1; i++) {
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, 40+25*i+5*i, 8, 8)];
        img.image = [UIImage imageNamed:@"kxd.png"];
        [xxView addSubview:img];

        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 35+25*i+5*i, 310, 20)];
        if (i == 0) {
            lab.text = [msgDic objectForKey:@"Company"];
        }else if (i == 1)
            lab.text = [msgDic objectForKey:@"LinkName"];
        else if (i == 2)
            lab.text = [msgDic objectForKey:@"Tel"];
        else if (i == 3)
            lab.text = [msgDic objectForKey:@"Fax"];
        else if (i == 4)
            lab.text = [msgDic objectForKey:@"Website"];
        else if (i == 5)
        {
            [lab setFrame:CGRectMake(20, 25+25*i+20, 310, 50)];
            lab.numberOfLines = 0;
            lab.text = [msgDic objectForKey:@"Addr"];
        }
        lab.backgroundColor = [UIColor clearColor];
        lab.font = [UIFont systemFontOfSize:15];
        [xxView addSubview:lab];
    }

    zixunneirong = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 574, 483)];
    [zixunneirong setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"nra.png"]]];
    [scrollView addSubview:zixunneirong];

    [self drawzxnr];
    
    send = [UIButton buttonWithType:0];
    [send setAlpha:1.0f];
    [send setFrame:CGRectMake(125, 836, 50, 50)];
    [send setImage:[UIImage imageNamed:@"fj.png"] forState:UIControlStateNormal];
    [send addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    [product addSubview:send];

}

- (void)drawzxnr
{
    zxnr = [[UITextView alloc]initWithFrame:CGRectMake(105, 80, 450, 68)];
    [zxnr setBackgroundColor:[UIColor clearColor]];
    zxnr.font = [UIFont systemFontOfSize:15.0f];
    zxnr.delegate = self;
    [zixunneirong addSubview:zxnr];

    address = [[UITextField alloc]initWithFrame:CGRectMake(105, 205, 450, 21)];
    [address setBackgroundColor:[UIColor clearColor]];
    address.font = [UIFont systemFontOfSize:15.0f];
    address.delegate = self;
    [zixunneirong addSubview:address];

    your_name = [[UITextField alloc]initWithFrame:CGRectMake(105, 279, 450, 21)];
    [your_name setBackgroundColor:[UIColor clearColor]];
    your_name.font = [UIFont systemFontOfSize:15.0f];
    your_name.delegate = self;
    your_name.placeholder = @"必填项";
    [zixunneirong addSubview:your_name];

    your_tele = [[UITextField alloc]initWithFrame:CGRectMake(105, 354, 450, 21)];
    [your_tele setBackgroundColor:[UIColor clearColor]];
    your_tele.font = [UIFont systemFontOfSize:15.0f];
    your_tele.delegate = self;
    your_tele.placeholder = @"必填项";
    your_tele.keyboardType = UIKeyboardTypeNumberPad;
    [zixunneirong addSubview:your_tele];

    mail = [[UITextField alloc]initWithFrame:CGRectMake(105, 430, 450, 21)];
    [mail setBackgroundColor:[UIColor clearColor]];
    mail.font = [UIFont systemFontOfSize:15.0f];
    mail.delegate = self;
    [zixunneirong addSubview:mail];
}

- (void)tapAction:(UITapGestureRecognizer*)sender{
    [zxnr resignFirstResponder];
    [address resignFirstResponder];
    [your_name resignFirstResponder];
    [your_tele resignFirstResponder];
    [mail resignFirstResponder];
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"stopClick" object:@"loginInfo"];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == address || textField == your_name || textField == your_tele || textField == mail) {
        [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 200) animated:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];
}

- (void)send
{
    if (your_name.text.length == 0) {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"错误" message:@"姓名不能为空!" delegate:Nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alt show];
    }else if (your_tele.text.length == 0) {
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"错误" message:@"电话不能为空!" delegate:Nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alt show];
    }else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [send setFrame:CGRectMake(1024, 496, 50, 50)];
        [send setAlpha:0.2f];
        [UIView commitAnimations];
        [self start];
    }
}

//开始上传
- (void)start
{
    NSLog(@"start!!!");
    NSString *post = [NSString stringWithFormat:@"uid=%d&content=%@&address=%@&name=%@&phone=%@&email=%@",kh_UID,zxnr.text,address.text,your_name.text,your_tele.text,mail.text];

    NSMutableData *postData = [NSMutableData dataWithData:[post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES]];
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    NSURL*url=[NSURL URLWithString:@"http://app.efu.com.cn/zhongfuapi/feedbackpost.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];

    self.appListFeedConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前没有网络，请先连接网络" delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alter show];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.appListData = [NSMutableData data];    // start off with new data
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.appListData appendData:data];  // append incoming data
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString* strRet = [[NSString alloc] initWithData:self.appListData encoding:NSUTF8StringEncoding];
    NSLog(@"strRet = %@",strRet);
    if ([strRet isEqualToString:@"1"]) {
        zxnr.text = @"";
        address.text = Nil;
        your_name.text = Nil;
        your_tele.text = Nil;
        mail.text = Nil;
        UIAlertView *alt = [[UIAlertView alloc]initWithTitle:@"提示" message:@"恭喜您，信息已发送成功！" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alt show];
    }else {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"当前网络不可用，请检查网络连接是否正确" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        send.alpha = 1.0f;
        [send setFrame:CGRectMake(125, 836, 50, 50)];
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

#pragma mark --tableview
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return msgArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier: SimpleTableIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.imageView.image = [UIImage imageNamed:@"sxd.png"];
    cell.textLabel.text = [msgArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.numberOfLines = 0;
    UIView *view = [[UIView alloc]init];
    cell.backgroundView = view;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    zxnr.text = [msgArray objectAtIndex:indexPath.row];

    [zxnr resignFirstResponder];
    [address resignFirstResponder];
    [your_name resignFirstResponder];
    [your_tele resignFirstResponder];
    [mail resignFirstResponder];
    [scrollView setContentOffset:CGPointMake(scrollView.contentOffset.x, 0) animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
