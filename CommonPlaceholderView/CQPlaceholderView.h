//
//  CQPlaceholderView.h
//  CommonPlaceholderView
//
//  Created by 蔡强 on 2017/5/15.
//  Copyright © 2017年 kuaijiankang. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 占位图的类型 */
typedef NS_ENUM(NSInteger, CQPlaceholderViewType) {
    /** 没网 */
    CQPlaceholderViewTypeNoNetwork = 1,
    /** 没订单 */
    CQPlaceholderViewTypeNoOrder,
    /** 没商品 */
    CQPlaceholderViewTypeNoGoods,
    /** 美丽的妹纸 */
    CQPlaceholderViewTypeBeautifulGirl
};

#pragma mark - @protocol

@class CQPlaceholderView;
@protocol CQPlaceholderViewDelegate <NSObject>

/** 占位图的重新加载按钮点击时回调 */
- (void)placeholderView:(CQPlaceholderView *)placeholderView
   reloadButtonDidClick:(UIButton *)sender;

@end

#pragma mark - @interface

@interface CQPlaceholderView : UIView

/** 占位图类型（只读） */
@property (nonatomic,assign,readonly) CQPlaceholderViewType type;
/** 占位图的代理方（只读） */
@property (nonatomic,weak,readonly) id <CQPlaceholderViewDelegate> delegate;

/**
 构造方法
 
 @param frame 占位图的frame
 @param type 占位图的类型
 @param delegate 占位图的代理方
 @return 指定frame、类型和代理方的占位图
 */
- (instancetype)initWithFrame:(CGRect)frame
                         type:(CQPlaceholderViewType)type
                     delegate:(id)delegate;

@end
