//
//  LGLCustomTextFiled.m
//  LGLTextView2
//
//  Created by 张彤 on 8/6/16.
//  Copyright © 2016 lgl.cn. All rights reserved.
//

#import "LGLCustomTextView.h"
#import "UIView+LGL.h"
@interface LGLCustomTextView()
/*  占位文字的label   */
@property (nonatomic, weak) UILabel *placeHolderLabel;
@end

@implementation LGLCustomTextView

//懒加载
- (UILabel *)placeHolderLabel
{
    if (!_placeHolderLabel) {
        //添加一个用来显示占位文字的label,label里面文字的特点,永远是垂直居中
        UILabel *placeHolderLabel = [[UILabel alloc]init];
        placeHolderLabel.x = 4;
        placeHolderLabel.y = 7;
        placeHolderLabel.numberOfLines = 0;//自动换行
       //placeHolderLabel.backgroundColor = [UIColor redColor];
        //placeHolderLabel.hidden = YES;
       [self addSubview:placeHolderLabel];
        self.placeHolderLabel = placeHolderLabel;
       // _placeHolderLabel = placeHolderLabel;
        
    }
    return _placeHolderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //垂直方向上永远有弹簧效果
        self.alwaysBounceVertical = YES;
        
        //设置默认字体
        self.font = [UIFont systemFontOfSize:17];
        
                //默认占位文字的颜色
        self.placeholderColor = [UIColor blackColor];
        //监听文字改变
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
        
    }
    return self;
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//实现监听文字改变的方法
- (void)textDidChange
{
   //只要有文字,那个label就应该隐藏
    self.placeHolderLabel.hidden = self.hasText;
}


- (void)layoutSubviews
{
//    //计算传进来的文字的尺寸,更新占位文字的尺寸,label的尺寸跟随文字的尺寸
//    CGSize maxSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-8, MAXFLOAT);
//   self.placeHolderLabel.size = [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    //先计算placeHolderLabel的宽度
    
    self.placeHolderLabel.width = self.width - 2*self.placeHolderLabel.x;
    //让高度自动算
    [self.placeHolderLabel sizeToFit];
   
}


//重写属性的setter方法,监听属性的变化
- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeHolderLabel.textColor = placeholderColor;
    [self setNeedsLayout];

}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    self.placeHolderLabel.text = placeholder;
    [self setNeedsLayout];

}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeHolderLabel.font = font;
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    [self textDidChange];
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self textDidChange];
    
}


@end
