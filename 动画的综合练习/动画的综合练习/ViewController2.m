//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import "ViewController2.h"
#import "ViewController3.h"
#define Snow_H 35
#define Snow_W 35

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"表情包";
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(createImageview) userInfo:nil repeats:YES];
    
    [self createImageview];
    [self createTwoButton];

    
    self.view.alpha = 1;
}


- (void)createImageview{
    
    CGFloat start = arc4random()%375;
    CGFloat end = arc4random()%375;
    
    NSMutableArray *arr = [[NSMutableArray alloc]initWithObjects:@"012.gif",@"018.gif",@"019.gif",@"020.gif",@"021.gif",@"022.gif",@"023.gif", nil];
    
    
    
    UIImageView *snow = [[UIImageView alloc]initWithFrame:CGRectMake(start, -Snow_H, Snow_W, Snow_H)];
    
    NSString *str1 = arr[arc4random()%7];
    
    [snow setImage:[UIImage imageNamed:str1]];
    
    
    [self.view addSubview:snow];
    
    [UIView animateWithDuration:5 animations:^{
        
        CGRect endframe = CGRectMake(end, 603-Snow_H, Snow_W, Snow_H);
        
        snow.frame = endframe;
        
    }completion:^(BOOL finished) {
        snow.alpha = 0.0;
        [UIView animateWithDuration:1 animations:^{
            
        } completion:^(BOOL finished) {
            
            [snow removeFromSuperview];
        }];
        
    }];
    
}

- (void)createTwoButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 70, 70);
    
    button.layer.cornerRadius = 35;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    [button setTitle:@"Next" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)next:(UIButton *)button{
    
    //    ViewController2 *view = [[ViewController2 alloc]init];
    //    view.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    ViewController3 *viewCL = [[ViewController3 alloc]init];
    
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
