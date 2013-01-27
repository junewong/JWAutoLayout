//
//  GridLayout.m
//  itravel
//
//  Created by june on 11-9-8.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GridLayout.h"


@implementation GridLayout

@synthesize rows;
@synthesize columns;
@synthesize interval_horizontal;
@synthesize interval_vertical;

- (id)init
{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
	return self;
}

- (void)_init
{
    rows = 1;
    columns = 1;
    padding_left = 0;
    padding_right = 0;
    padding_top = 0;
    padding_bottom = 0;
    interval_horizontal = 0;
    interval_vertical = 0;
}

-(void) layoutSubviews
{
	[super layoutSubviews];

	
	// 重新计算行数
    if (self.columns > 1) {
        self.rows = floor([self.subviews count] / self.columns);
    } else if (self.rows > 1) {
        self.columns = floor([self.subviews count] / self.rows);
    }
	
	// 根据最大格子确定每个格子的宽高
	CGSize maxSize = [self getMaxSizeWithSubviews];
	CGFloat iWidth = maxSize.width, iHeight = maxSize.height;
	
	// 逐一安排每个格子的位置;
	int i = 0;
	CGFloat pos_x, pos_y;
    CGFloat max_pos_x = 0, max_pos_y = 0;
	for (UIView* view in self.subviews) 
	{		
		[self checkLayoutIfNeeds:view];
		
		int grid_x = fmod(i, self.columns);
		int grid_y = floor(i / self.columns);
		
		if (grid_x == 0) {
			pos_x = self.padding_left;
			
			if (grid_y == 0) {
				pos_y = self.padding_top;
			} else {
				pos_y += (iHeight + self.interval_vertical);
			}
			
		} else {
			pos_x += (iWidth + self.interval_horizontal);
		}
		
		CGRect v_rect = view.frame;
		v_rect.origin.x = pos_x;
		v_rect.origin.y = pos_y;
		view.frame = v_rect;
        
        max_pos_x = MAX(max_pos_x, pos_x);
        max_pos_y = MAX(max_pos_y, pos_y);
		
		i++;
	}
	
	// 重新设置外围边框大小
	CGFloat wrap_width = max_pos_x + iWidth + self.padding_right;
	CGFloat wrap_height = max_pos_y + iHeight + self.padding_bottom;

	CGRect wrap_rect = self.frame;
	wrap_rect.size.width = wrap_width;
	wrap_rect.size.height = wrap_height;
	self.frame = wrap_rect;
    
    //NSLog(@"gridLayout:%@",NSStringFromCGRect(self.frame));
	
}


@end
