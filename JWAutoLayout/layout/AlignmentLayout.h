//
//  AlignmentLayout.h
//  itravel
//
//  对齐布局,用于让添加的子视图在布局中保持特定的位置,可以有9种对齐的类型.
//  添加子视图的时候,可以使用 addSubview:alignment 方法在添加的同时指定特定对齐类型.
//
//  注意需要明确设置本类的宽高.
//
//  Created by june on 11-11-26.
//  Copyright 2011 upengyou.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWAutoLayout.h"

// 定义布局的位置类型
typedef enum AlignmentLayoutType {
	// 左上角
	AlignmentLayoutTypeTopLeft = 1,
	// 顶部中间
	AlignmentLayoutTypeTopCenter,
	// 右上角
	AlignmentLayoutTypeTopRight,
	// 中间左边
	AlignmentLayoutTypeMiddleLeft,
	// 正中央
	AlignmentLayoutTypeMiddleCenter,
	// 中间右边
	AlignmentLayoutTypeMiddleRight,
	// 左下角
	AlignmentLayoutTypeBottomLeft,
	// 底部中间
	AlignmentLayoutTypeBottomCenter,
	// 右下角
	AlignmentLayoutTypeBottomRight,

} AlignmentLayoutType;


@interface AlignmentLayout : JWAutoLayout {

}

// 记录各个视图的位置类型 
@property (nonatomic, retain) NSMutableDictionary* _alignments;


- (void)initComponets;

// 添加子视图,以及指定对齐方式
- (void)addSubview:(UIView*)view alignment:(AlignmentLayoutType)alignment;

@end
