//
//  LocationInfo.h
//  动画的综合
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 wangli. All rights reserved.
//


#import "ViewController4.h"
#import "ViewController5.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"旋转囡囡";
    [self createimageview];
    [self createSmallImageview];
    [self createButton];
    [self createTwoButton];
   
}

- (void)createimageview{
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    NSString *filepath = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filepath];
    imageview.image = image;
    
    [self.view addSubview:imageview];
    
}

- (void)createSmallImageview{
    
    UIImageView *smallview = [[UIImageView alloc]init];
    smallview.bounds = CGRectMake(0, 0, 70, 70);
    smallview.center = CGPointMake(375/2, 667/2);
    
    smallview.image = [UIImage imageNamed:@"player1.png"];
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <=12 ; i ++) {
        NSString *imagename = [NSString stringWithFormat:@"player%d.png",i];
        UIImage *image = [UIImage imageNamed:imagename];
        [arr addObject:image];
    }
    smallview.tag = 100;
    smallview.animationImages = arr;
    smallview.animationDuration = 1;
    smallview.animationRepeatCount = 0;
    
    [self.view addSubview:smallview];
    
}

- (void)createButton{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 200, 70, 70);
    button.backgroundColor = [UIColor purpleColor];
    
    button.layer.cornerRadius = 35;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    
    [button setTitle:@"动起来" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor blueColor];
    button2.frame = CGRectMake(250, 200, 70, 70);
    
    button2.layer.cornerRadius = 35;
    button2.layer.borderColor = [UIColor redColor].CGColor;
    button2.layer.borderWidth = 5;
    
    [button2 setTitle:@"停下来" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button2];
    
    [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    [button2 addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)start{
    
    UIImageView *view2 = (UIImageView *)[self.view viewWithTag:100];
    [view2 startAnimating];
}

- (void)stop{
    
    UIImageView *view2 = (UIImageView *)[self.view viewWithTag:100];
    [view2 stopAnimating];
    
}

- (void)createTwoButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 70, 70);
    [button setTitle:@"Next" forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 35;
    button.layer.borderColor = [UIColor redColor].CGColor;
    button.layer.borderWidth = 5;
    
    button.backgroundColor = [UIColor brownColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)next:(UIButton *)button{
    
    ViewController5 *viewCL = [[ViewController5 alloc]init];
    
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
