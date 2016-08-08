//
//  ViewController.m
//  LGLCustomTextViewDemo
//
//  Created by 张彤 on 8/8/16.
//  Copyright © 2016 lgl.cn. All rights reserved.
//

#import "ViewController.h"
#import "LGLCustomTextView.h"
#import "UIView+LGL.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LGLCustomTextView *cusView = [[LGLCustomTextView alloc]init];
    CGFloat cusViewW = self.view.width;
    CGFloat cusViewH = 200;
    CGFloat cusViewX = 4;
    CGFloat cusViewY = 7;
    cusView.frame = CGRectMake(cusViewX,cusViewY ,cusViewW, cusViewH);
    cusView.placeholder = @"这里添加文字,请勿发布色情";
    cusView.placeholderColor = [UIColor redColor];
    [self.view addSubview:cusView];
}


@end
