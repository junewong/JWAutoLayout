//
//  SHLayout.m
//  itravel
//
//  Created by june on 11-9-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JWAutoLayout.h"


@implementation JWAutoLayout

@synthesize padding_left;
@synthesize padding_right;
@synthesize padding_top;
@synthesize padding_bottom;
@synthesize width, height;
@synthesize x, y;

-(id) init
{
	if ((self = [super init])) {
		padding_left = 0;
		padding_right = 0;
		padding_top = 0;
		padding_bottom = 0;

	}
	return self;
}


// 获取所有子视图的宽高值中的最大值
- (CGSize) getMaxSizeWithSubviews
{
	CGFloat iWidth = 0, iHeight = 0;
	for (UIView* view in self.subviews) {
		iWidth = MAX(iWidth, view.frame.size.width);
		iHeight = MAX(iHeight, view.frame.size.height);
	}
	return CGSizeMake(iWidth, iHeight);
}


// 用于测试子类如果是布局类,需要先让其进行布局
-(void) checkLayoutIfNeeds:(UIView*)view
{
	if ([view isKindOfClass:[JWAutoLayout class]]) {
		[view setNeedsLayout];
		[view layoutIfNeeded];
	}
}

#pragma mark -
#pragma mark 单独设置宽高和坐标

- (void) setWidth:(CGFloat)w
{
	CGRect rect = self.frame;
	rect.size.width = w;
	self.frame = rect;
}

-(void) setHeight:(CGFloat)h
{
	CGRect rect = self.frame;
	rect.size.height = h;
	self.frame = rect;
}

-(void) setX:(CGFloat)value
{
	CGRect rect = self.frame;
	rect.origin.x = value;
	self.frame = rect;
}

-(void) setY:(CGFloat)value
{
	CGRect rect = self.frame;
	rect.origin.y = value;
	self.frame = rect;
}

- (void) removeAllSubsviews
{
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}


@end
