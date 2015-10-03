//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import <UIKit/UIKit.h>

@class ViewController6;

@protocol myselfPro <NSObject>

- (void)viewContriller6:(ViewController6 *)viewcotroll userName:(NSString *)username passWord:(NSString *)password;

@end

@interface ViewController6 : UIViewController

@property (nonatomic,weak)id <myselfPro> delegate;

@end
