//
//  FloatLayout.m
//  itravel
//
//  Created by june on 11-9-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JWFlowLayout.h"


@implementation JWFlowLayout

@synthesize flowDirection;
@synthesize autoInterval;

-(id) init
{
	if ((self = [super init])) {
		padding_left = 0;
		padding_right = 0;
		padding_top = 0;
		padding_bottom = 0;
		
		autoInterval = 0;
		
		self.flowDirection = FlowLayoutDirectionVertical;
		_intervals = [[NSMutableDictionary alloc] initWithCapacity:1];
	}
	return self;
}

#pragma mark -
#pragma mark 布局方法

-(void) layoutSubviews
{
	[super layoutSubviews];
	
	if (self.flowDirection == FlowLayoutDirectionVertical) {
		[self layoutSubviewsForVertical];
		
	} else if (self.flowDirection == FlowLayoutDirectionHorizontal) {
		[self layoutSubviewsForHorizontal];
	}
}

// 水平流式布局
-(void) layoutSubviewsForHorizontal
{
	int i = 0;
	CGFloat pos_x, pos_y;
	
	// 计算每个子视图的位置
	for (UIView* view in self.subviews)
	{
		[self checkLayoutIfNeeds:view];
		
		if (i == 0) {
			pos_x = self.padding_left;
			pos_y = self.padding_top;
		} else {
			// 计算间隔
			pos_x += ([self intervalAtIndex:i]);
		}
		
		// 设置位置
		CGRect rect = view.frame;
		rect.origin.x = pos_x;
		rect.origin.y = pos_y;
		view.frame = rect;
		
		pos_x += rect.size.width;
		
		i++;
	}
	
	// 重新设置整体的宽高
	CGRect wrap_rect = self.frame;
	wrap_rect.size.width = pos_x + self.padding_right;
	if (wrap_rect.size.height == 0) {
		wrap_rect.size.height = self.padding_top + [self getMaxSizeWithSubviews].height + self.padding_bottom;
	}	
	self.frame = wrap_rect;
}

// 垂直流式布局
-(void) layoutSubviewsForVertical
{
	int i = 0;
	CGFloat pos_x, pos_y;
	
	// 计算每个子视图的位置
	for (UIView* view in self.subviews)
	{
		[self checkLayoutIfNeeds:view];
		
		if (i == 0) {
			pos_x = self.padding_left;
			pos_y = self.padding_top;
		} else {
			// 计算间隔
			pos_y += ([self intervalAtIndex:i]);
		}
		
		// 设置位置
		CGRect rect = view.frame;
		rect.origin.x = pos_x;
		rect.origin.y = pos_y;
		view.frame = rect;
		
		pos_y += rect.size.height;
		
		i++;
	}
	
	// 重新设置整体的宽高
	CGRect wrap_rect = self.frame;
	wrap_rect.size.height = pos_y + self.padding_bottom;
	if (wrap_rect.size.width == 0) {
		wrap_rect.size.width = self.padding_left + [self getMaxSizeWithSubviews].width + self.padding_right;
	}	
	self.frame = wrap_rect;

}

// 添加当前子视图和下一个子视图的间隔长度
-(void) addInterval:(CGFloat)value
{
	[_intervals setObject:[NSNumber numberWithFloat:value] forKey:[NSString stringWithFormat:@"%d", [self.subviews count]] ];
}

// 返回间隔长度
-(CGFloat) intervalAtIndex:(int)index
{
	CGFloat interval;
	NSNumber* value = [_intervals objectForKey:[NSString stringWithFormat:@"%d", index]];
	if (value != nil) {
		interval = [value floatValue];
	} else {
		interval = self.autoInterval;
	}
	return interval;
}

@end
