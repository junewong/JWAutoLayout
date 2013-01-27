//
//  FloatLayout.h
//  itravel
//
//  流式布局:
//
//  用于将通过addSubsview添加的子视图按指定方向一次排列,同时本布局视图
//  会根据子视图自动调整宽高;
//
//  流式布局的排布方向由水平方向和垂直方向两种,默认是垂直方向.
//
//  子视图的间隔可以有两种方式指定,一种是通过autoInterval属性指定所有间隔的大小,
//  默认为0. 同时还可以使用addInterval方法为每个子视图的前面添加一个指定大小的间隔.
//
//
//  Created by june on 11-9-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JWLayout.h"

// 定义流式布局的方向
typedef enum FlowLayoutDirection {
	// 垂直方向
	FlowLayoutDirectionVertical = 1,
	// 水平方向
	FlowLayoutDirectionHorizontal

} FlowLayoutDirection;

@interface JWFlowLayout : JWLayout {
	
	int flowDirection;
	CGFloat autoInterval;
	NSMutableDictionary* _intervals;

}

@property int flowDirection;
@property CGFloat autoInterval;


// 水平流式布局
-(void) layoutSubviewsForHorizontal;

// 垂直流式布局
-(void) layoutSubviewsForVertical;

// 添加当前子视图和下一个子视图的间隔长度
-(void) addInterval:(CGFloat)value;

// 返回间隔长度
-(CGFloat) intervalAtIndex:(int)index;

@end
