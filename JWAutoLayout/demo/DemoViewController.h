//
//  DemoViewController.h
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import <UIKit/UIKit.h>

// detect iphone 5:
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


@interface DemoViewController : UIViewController
{
    int buttonCounter;
}

@property (nonatomic) NSString *navigationBarTitle;
@property (unsafe_unretained, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIToolbar *boundsToolbar;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *tipLabel;

- (UIButton*)createButtonWithWidth:(CGFloat)width height:(CGFloat)height title:(NSString*)title;
- (UIView*)createButtonWithWidth: (CGFloat)width;
- (UIButton*)createButtonWithWidth:(CGFloat)width height:(CGFloat)height;
- (UIButton*)createButtonWithTitle: (NSString*)title;
- (NSArray*)getAllButtons;

- (void)minusBoundsWithView:(UIView*)aView;
- (void)plusBoundsWithView:(UIView*)aView;

- (IBAction)clickMinusButton:(id)sender;
- (IBAction)clickPlusButton:(id)sender;

@end
