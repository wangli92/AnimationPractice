//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import "ViewController5.h"

@interface ViewController5 (){
    UIView *_ballView;
    NSTimer *_timer;
    
    NSInteger xMove;
    NSInteger yMove;
   // UIView *_viewblock;
    
    UILabel *_lable;

}

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    xMove = 1;
    yMove = 1;
    
    [self createball];
    [self createtimer];
    [self createbouns];
    [self createbutton];
    [self createview];
   
}


- (void)createview{
    
    CGRect rect = [UIScreen mainScreen].bounds;
    CGFloat screenwidth = rect.size.width;
    CGFloat width = screenwidth/8.0;
    CGFloat hight = screenwidth/8.0;
    
    for (int i = 0; i < 7; i++) {
        for (int j = 0; j < 8; j++) {
            
          UIImageView *viewblock = [[UIImageView alloc]initWithFrame:CGRectMake(j*width, i*hight/2-300, width, hight/2)];
            
           viewblock.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
            
            viewblock.tag = i*8+j+1;
            
            viewblock.layer.borderColor = [UIColor blackColor].CGColor;
            viewblock.layer.borderWidth = 2;
            
            
            [UIView animateWithDuration:2 animations:^{
                
                CGRect endframe = CGRectMake(j*width, i*hight/2, width, hight/2);
                
                viewblock.frame = endframe;
               // [viewblock removeFromSuperview];
                
            }completion:^(BOOL finished) {
                
            }];
            

            
            
            [self.view addSubview:viewblock];
        }
    }
    
}

- (void)createball{
    _ballView = [[UIView alloc]initWithFrame:CGRectMake(100, 400, 40, 40)];
    _ballView.backgroundColor = [UIColor blackColor];
    _ballView.layer.cornerRadius = 20;
    _ballView.layer.borderColor = [UIColor redColor].CGColor;
    _ballView.layer.borderWidth = 5;
    
    [self.view addSubview:_ballView];
    
}

- (void)createtimer{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ontime:) userInfo:nil repeats:YES];
    
}

- (void)ontime:(NSTimer *)timer{
    
    
    
    CGPoint currentCenter = _ballView.center;
    
    if (CGRectGetMaxX(_ballView.frame) >= 375) {
        xMove = -1;
    }
    if (CGRectGetMinX(_ballView.frame) <= 0) {
        
        xMove = 1;
    }
    if (CGRectGetMaxY(_ballView.frame) >= 500 ) {
        
        if ( ((_ballView.center.x) >= (_lable.frame.origin.x)) && ((_ballView.center.x) <= (_lable.frame.origin.x+100))) {
            yMove = -1;
        }
        else{
            UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你输了！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
            
            [view show];
            [timer invalidate];
            timer = nil;
        }
        
    }

    
    
    for (int i = 1; i <= 56; i++) {
        
    UIImageView *view = (UIImageView *)[self.view viewWithTag:i];
        
    if ((CGRectGetMaxX(_ballView.frame) == CGRectGetMinX(view.frame))&&((_ballView.center.x) <= (CGRectGetMaxY(view.frame)) && (_ballView.center.x)>= (CGRectGetMinY(view.frame))) ) {
            xMove = -1;
        
        
        //[view setImage:[UIImage imageNamed:@"012.gif"]];
        
        [UIView animateWithDuration:1 animations:^{
            
            CGRect endframe = CGRectMake(arc4random()%375, 603-375/8.0, 375/8.0, 375/16.0);
            
            //CGRectMake(j*width, i*hight/2-300, width, hight/2)
            
            view.frame = endframe;
           // [view removeFromSuperview];
            
        }completion:^(BOOL finished) {
            
            
            view.alpha = 0.0;
            
            [UIView animateWithDuration:1 animations:^{
                
            } completion:^(BOOL finished) {
                
                [view removeFromSuperview];
            }];
            
        }];

        
        }
        
    if ((CGRectGetMinX(_ballView.frame) == (CGRectGetMaxX(view.frame)) && (_ballView.center.x) <= (CGRectGetMaxY(view.frame)) && (_ballView.center.x)>= (CGRectGetMinY(view.frame)))) {
        
        xMove = -1;
        
        _ballView.layer.borderColor = [UIColor redColor].CGColor;
        _ballView.layer.borderWidth = 2;
        
        
        [UIView animateWithDuration:1 animations:^{
            
            CGRect endframe = CGRectMake(arc4random()%375, 603-375/8.0, 375/8.0, 375/16.0);
            
            view.frame = endframe;
            //[view removeFromSuperview];
            
        }completion:^(BOOL finished) {
            
            
            view.alpha = 0.0;
            [UIView animateWithDuration:1 animations:^{
                
            } completion:^(BOOL finished) {
                
                [view removeFromSuperview];
                
            }];
            
        }];

        
        
        }
        
//        ||(CGRectGetMinX(_ballView.frame) == (CGRectGetMaxY(view.frame)) && (_ballView.center.y) <= (CGRectGetMaxY(view.frame)) && (_ballView.center.x)>= (CGRectGetMinY(view.frame)))||((CGRectGetMaxX(_ballView.frame) == CGRectGetMinX(view.frame))&&((_ballView.center.y) <= (CGRectGetMaxY(view.frame)) && (_ballView.center.x)>= (CGRectGetMinY(view.frame))) && CGRectGetMinY(_ballView.frame)<= 64)
        
    if ((CGRectGetMinY(_ballView.frame) <= (CGRectGetMaxY(view.frame)) && (_ballView.center.x) >= (view.frame.origin.x) && (_ballView.center.x)<= ( view.frame.origin.x+375/8.0))) {
        
        yMove = 1;
        
        _ballView.layer.borderColor = [UIColor redColor].CGColor;
        _ballView.layer.borderWidth = 2;
        
        //[view setImage:[UIImage imageNamed:@"012.gif"]];
        
        [UIView animateWithDuration:1 animations:^{
            
            CGRect endframe = CGRectMake(arc4random()%375, 603-375/8.0, 375/8.0, 375/16.0);
            
            view.frame = endframe;
            //[view removeFromSuperview];
            
        }completion:^(BOOL finished) {
            
            
            view.alpha = 0.0;
            [UIView animateWithDuration:1 animations:^{
                
            } completion:^(BOOL finished) {
                
                [view removeFromSuperview];
            }];
            
        }];

        
        
    }
    }
    
    
    CGPoint newCenter = CGPointMake(currentCenter.x+xMove, currentCenter.y+yMove);
    _ballView.center = newCenter;
}

- (void)createbouns{
    
    _lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 500, 100, 5)];
    _lable.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_lable];
    
}

- (void)createbutton{
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button1.frame = CGRectMake(80, 550,70 , 35);
    [button1 setTitle:@"<<<<" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor whiteColor];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button1.layer.backgroundColor = [UIColor orangeColor].CGColor;
    button1.layer.borderWidth = 5;
    
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button2.frame = CGRectMake(240, 550,70 , 35);
    [button2 setTitle:@">>>>" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor whiteColor];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    button2.layer.backgroundColor = [UIColor orangeColor].CGColor;
    button2.layer.borderWidth = 5;
    
    [button1 addTarget:self action:@selector(reght:) forControlEvents:UIControlEventTouchUpInside];
    
    [button2 addTarget:self action:@selector(left:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button2];
    
    
}

- (void)reght:(UIButton *)button{
    
    CGRect rect = _lable.frame;
    rect.origin.x -= 50;
    _lable.frame = rect;
    
}

- (void)left:(UIButton *)button{
    
    CGRect rect = _lable.frame;
    rect.origin.x += 50;
    _lable.frame = rect;
    
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
