//
//  SHLayout.h
//  itravel
//
//  布局类的基类,用于方便对添加的子视图的位置按规则进行排布,而不用
//  去计算每个子视图的位置以及父视图的大小.
//
//  布局视图本身的宽或者高能根据子视图的变化而变化.
//
//  添加子视图的方法仍然是使用UIView的addSubsview方法.
//
//  基类定义了多个padding, 默认为0.
//  还有x,y,width,height等几个常用属性的快捷访问方法;
//
//  Created by june on 11-9-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SHLayout : UIView {

	CGFloat padding_left;
	CGFloat padding_right;
	CGFloat padding_top;
	CGFloat padding_bottom;
	
	CGFloat x;
	CGFloat y;
	CGFloat width;
	CGFloat height;
}

@property (nonatomic) CGFloat padding_left;
@property (nonatomic) CGFloat padding_right;
@property (nonatomic) CGFloat padding_top;
@property (nonatomic) CGFloat padding_bottom;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

// 获取所有子视图的宽高值中的最大值
- (CGSize) getMaxSizeWithSubviews;

// 用于测试子类如果是布局类,需要先让其进行布局
-(void) checkLayoutIfNeeds:(UIView*)view;

// 删除所有的子view
- (void) removeAllSubsviews;


@end
