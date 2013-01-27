//
//  AlignmentLayout.m
//  itravel
//
//  Created by june on 11-11-26.
//  Copyright 2011 upengyou.com. All rights reserved.
//

#import "AlignmentLayout.h"

@implementation AlignmentLayout

@synthesize _alignments;

-(id) init
{
	if ((self = [super init])) {
		[self initComponets];
	}
	return self;
}

- (id)initWithFrame:(CGRect)rect
{
	if ((self = [super initWithFrame:rect])) {
		[self initComponets];
	}
	return self;
}

- (void)initComponets
{
	padding_left = 0;
	padding_right = 0;
	padding_top = 0;
	padding_bottom = 0;

}

// 修改为属性方法，避免在xib文件中创建的时候不会自动调用init而不会初始化
- (NSMutableDictionary*)_alignments
{
    if (_alignments == nil) {
        _alignments = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    return _alignments;
}

#pragma mark -
#pragma mark 公开方法

// 添加子视图的同时指定对齐位置
- (void)addSubview:(UIView*)view alignment:(AlignmentLayoutType)alignment
{
	NSString* key = [NSString stringWithFormat:@"%d", [self._alignments count]];
	[self._alignments setObject:[NSNumber numberWithInt:alignment] forKey:key];
	[self addSubview:view];
}

#pragma mark -
#pragma mark 布局方法

-(void) layoutSubviews
{
	[super layoutSubviews];

	CGFloat outWidth = self.frame.size.width;
	CGFloat outHeight = self.frame.size.height;

	// 计算每个子视图的位置
	int index = 0;
	for (UIView* view in self.subviews)
	{
		[self checkLayoutIfNeeds:view];

		CGRect rect = view.frame;
		CGFloat viewWidth =  rect.size.width;
		CGFloat viewHeight =  rect.size.height;
		
		NSString* key = [NSString stringWithFormat:@"%d", index];
		AlignmentLayoutType alignment = [(NSNumber*)[self._alignments objectForKey:key] intValue];

		switch (alignment)
		{
			// 顶部中间
			case AlignmentLayoutTypeTopCenter:
				rect.origin.x = (outWidth - viewWidth) / 2 + padding_left;
				rect.origin.y = padding_top;
				break;

			// 顶部右边
			case AlignmentLayoutTypeTopRight:
				rect.origin.x = outWidth - viewWidth - padding_right;
				rect.origin.y = padding_top;
				break;

			// 中间左边
			case AlignmentLayoutTypeMiddleLeft:
				rect.origin.x = padding_left;
				rect.origin.y = (outHeight - viewHeight) / 2 + padding_top;
				break;

			// 正中央
			case AlignmentLayoutTypeMiddleCenter:
				rect.origin.x = (outWidth - viewWidth) / 2 + padding_left;
				rect.origin.y = (outHeight - viewHeight) / 2 + padding_top;
				break;

			// 中间右边
			case AlignmentLayoutTypeMiddleRight:
				rect.origin.x = outWidth - viewWidth - padding_right;
				rect.origin.y = (outHeight - viewHeight) / 2 + padding_top;
				break;

			// 左下角
			case AlignmentLayoutTypeBottomLeft:
				rect.origin.x = padding_left;
				rect.origin.y = outHeight - viewHeight - padding_bottom;
				break;

			// 底部中间
			case AlignmentLayoutTypeBottomCenter:
				rect.origin.x = (outWidth - viewWidth) / 2 + padding_left;
				rect.origin.y = outHeight - viewHeight - padding_bottom;
				break;

			// 右下角
			case AlignmentLayoutTypeBottomRight:
				rect.origin.x = outWidth - viewWidth - padding_right;
				rect.origin.y = outHeight - viewHeight - padding_bottom;
				break;

			// 左上角
			default:
				rect.origin.x = padding_left;
				rect.origin.y = padding_top;
				break;
		}

		view.frame = rect;
		
		index ++;
		
	} //end for
}

@end
