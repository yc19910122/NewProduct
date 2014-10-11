//
//  Play_PageViewController.h
//  ZFW_shuban
//
//  Created by User #⑨ on 13-8-7.
//  Copyright (c) 2013年 Yang Chao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface Play_PageViewController : UIViewController<UITextViewDelegate>
{
    MPMoviePlayerController *play;
}

@property (strong, nonatomic) NSString *Video_Name;
@property int tag;

@end
