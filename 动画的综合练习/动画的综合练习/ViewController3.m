//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import "ViewController3.h"
#import "ViewController4.h"

#define BALL_WIDHT 80
#define BALL_HEIGHT 80

#define BASE_TAG 100

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height-64

#define randnomColor (arc4random()%256/255.0)

@interface ViewController3 (){

    BOOL _isshowwindow;
}

@end

@implementation ViewController3

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"弹簧球";
    
    [self createTwoButton];
    
    [self createButton];
    
    [self crateFourball];
}

- (void)crateFourball{
    
    CGFloat padding = (SCREEN_WIDTH-4*BALL_WIDHT)/5;
    for (int i = 0 ; i < 4; i ++) {
        UIView *ball = [[UIView alloc]initWithFrame:CGRectMake(padding+(BALL_WIDHT+padding)*i, SCREEN_HEIGHT, BALL_WIDHT, BALL_HEIGHT)];
        ball.backgroundColor = [UIColor colorWithRed:randnomColor green:randnomColor blue:randnomColor alpha:1.0];
        
        ball.layer.cornerRadius = BALL_WIDHT/2;
        ball.tag = i+100;
        
        [self.view addSubview:ball];
    }

    
}

- (void)createButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 70, 70);
    button.center = CGPointMake(SCREEN_WIDTH/2, 180);
    
    button.layer.cornerRadius = 35;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    button.backgroundColor = [UIColor brownColor];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}

- (void)buttonClick:(UIButton *)button{
    if (!_isshowwindow) {
        [self showball];
    }
    else{
        [self hideball];
    }
    _isshowwindow = !_isshowwindow;
}

- (void)showball{
    
    for (int i = 0; i < 4; i ++) {
    
        UIView *ballview = [self.view viewWithTag:i+BASE_TAG];
        [UIView animateWithDuration:0.5 delay:0.1*i usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            CGPoint center = ballview.center;
            CGPoint newcenter = CGPointMake(center.x, center.y-300);
            ballview.center = newcenter;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}

- (void)hideball{
    
    for (int i = 0; i < 4; i ++) {
        
        UIView *ballview = [self.view viewWithTag:i+BASE_TAG];
        [UIView animateWithDuration:0.5 delay:0.1*i usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            CGPoint center = ballview.center;
            CGPoint newcenter = CGPointMake(center.x, center.y+300);
            ballview.center = newcenter;
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
}

- (void)createTwoButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 70, 70);
    [button setTitle:@"Next" forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 35;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)next:(UIButton *)button{
    
    ViewController4 *viewCL = [[ViewController4 alloc]init];
    
    [self.navigationController pushViewController:viewCL animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
