//
//  GridLayout.h
//  itravel
//
//  格子布局:
//
//  用于N行N列的格子布局方式,特点是每个格子都是一样大小.
//  每个格子的最终大小,会根据添加的子视图最大的宽和高来决定的.
// 
//  使用时可通过columns属性指定多少列,此时行属性rows会自动计算.
//
//  使用interval_horizontal和interval_vertical属性可分别指定水平间隔和垂直间隔,默认为0.
//
//  Created by june on 11-9-8.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWAutoLayout.h"


@interface GridLayout : JWAutoLayout {
	int rows;
	int columns;

	CGFloat interval_horizontal;
	CGFloat interval_vertical;
}

@property int rows;
@property int columns;


@property CGFloat interval_horizontal;
@property CGFloat interval_vertical;



@end
