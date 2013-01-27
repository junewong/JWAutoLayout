//
//  DemoViewController.m
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)init
{
    self = [super initWithNibName:@"DemoViewController" bundle:nil];
    if (self) {
        buttonCounter = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (!IS_IPHONE_5) {
        CGRect frame = self.tipLabel.frame;
        frame.origin.y = self.boundsToolbar.frame.origin.y - frame.size.height;
        self.tipLabel.frame = frame;
    }
}

- (void)viewDidUnload {
    [self setContentView:nil];
    [self setBoundsToolbar:nil];
    [self setTipLabel:nil];
    [super viewDidUnload];
}

#pragma mark - click event

- (IBAction)clickMinusButton:(id)sender
{
}

- (IBAction)clickPlusButton:(id)sender
{
}

#pragma mark - change frame

- (void)minusBoundsWithView:(UIView*)aView
{
    CGRect frame = aView.frame;
    frame.size.width -= 20.0f;
    frame.size.height -= 20.0f;
    aView.frame = frame;
}

- (void)plusBoundsWithView:(UIView*)aView
{
    CGRect frame = aView.frame;
    frame.size.width += 20.0f;
    frame.size.height+= 20.0f;
    aView.frame = frame;
}

#pragma mark - create button

- (UIButton*)createButtonWithWidth:(CGFloat)width height:(CGFloat)height title:(NSString*)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, width, height);
    button.backgroundColor = [UIColor greenColor];
    
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    button.titleLabel.numberOfLines = 2;
    
    button.tag = ++buttonCounter;
    
    return button;
}

- (UIButton*)createButtonWithWidth:(CGFloat)width height:(CGFloat)height
{
    return [self createButtonWithWidth:width height:height title:@""];
}

- (UIButton*)createButtonWithWidth:(CGFloat)width
{
    NSString *title = [NSString stringWithFormat:@"%.0fw", width];
    UIButton *button = [self createButtonWithWidth:width height:50.0f title:title];
    
    return button;
}

- (UIButton*)createButtonWithTitle:(NSString*)title
{
    UIButton *button = [self createButtonWithWidth:80.0f height:80.0f title:title];
    return button;
}

- (NSArray*)getAllButtons
{
    NSMutableArray *array = [NSMutableArray array];
    
    int tag = buttonCounter;
    do {
        UIButton *button = (UIButton*)[self.contentView viewWithTag:tag];
        if (button != nil && [button isKindOfClass:[UIButton class]]) {
            [array addObject:button];
        }
    } while (tag--);
    
    return array;
}

@end
