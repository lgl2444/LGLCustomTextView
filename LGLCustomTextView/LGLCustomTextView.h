//
//  LGLCustomTextFiled.h
//  LGLTextView2
//
//  Created by 张彤 on 8/6/16.
//  Copyright © 2016 lgl.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGLCustomTextView : UITextView
/*  占位文字      */
@property (nonatomic, copy) NSString *placeholder;

/*  占位文字的颜色     */
@property (nonatomic, strong) UIColor *placeholderColor;


@end
