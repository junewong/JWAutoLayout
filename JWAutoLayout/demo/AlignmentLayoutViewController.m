//
//  AlignmentViewController.m
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import "AlignmentLayoutViewController.h"

@interface AlignmentLayoutViewController ()

@end

@implementation AlignmentLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tipLabel.text = NSLocalizedString(@"tips_alignmentlayout_demo", @"");
    
    alignmentLayout = [[AlignmentLayout alloc] initWithFrame:CGRectMake(10, 10, 300, 380)];
    alignmentLayout.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3f];
    
    // buttons:
    UIButton *button1 = [self createSmailButtonWithTitle:@"top left"];
    UIButton *button2 = [self createSmailButtonWithTitle:@"top center"];
    UIButton *button3 = [self createSmailButtonWithTitle:@"top right"];
    
    UIButton *button4 = [self createSmailButtonWithTitle:@"middle left"];
    UIButton *button5 = [self createBigButtonWithTitle:@"middle center"];
    UIButton *button6 = [self createSmailButtonWithTitle:@"middle right"];
    
    UIButton *button7 = [self createSmailButtonWithTitle:@"bottom left"];
    UIButton *button8 = [self createSmailButtonWithTitle:@"bottom center"];
    UIButton *button9 = [self createSmailButtonWithTitle:@"bottom right"];
    
    // add buttons in diffrent alignment:
    [alignmentLayout addSubview:button1 alignment:AlignmentLayoutTypeTopLeft];
    [alignmentLayout addSubview:button2 alignment:AlignmentLayoutTypeTopCenter];
    [alignmentLayout addSubview:button3 alignment:AlignmentLayoutTypeTopRight];
    [alignmentLayout addSubview:button4 alignment:AlignmentLayoutTypeMiddleLeft];
    [alignmentLayout addSubview:button5 alignment:AlignmentLayoutTypeMiddleCenter];
    [alignmentLayout addSubview:button6 alignment:AlignmentLayoutTypeMiddleRight];
    [alignmentLayout addSubview:button7 alignment:AlignmentLayoutTypeBottomLeft];
    [alignmentLayout addSubview:button8 alignment:AlignmentLayoutTypeBottomCenter];
    [alignmentLayout addSubview:button9 alignment:AlignmentLayoutTypeBottomRight];
    
    [self.contentView addSubview:alignmentLayout];
}

#pragma mark - create button

- (UIButton*)createSmailButtonWithTitle:(NSString*)title
{
    return [self createButtonWithWidth:70.f height:70.f title:title];
}

- (UIButton*)createBigButtonWithTitle:(NSString*)title
{
    return [self createButtonWithWidth:100.f height:100.f title:title];
}

#pragma mark - click event

- (IBAction)clickMinusButton:(id)sender
{
    [super clickMinusButton:sender];
    [self minusBoundsWithView:alignmentLayout];
}

- (IBAction)clickPlusButton:(id)sender
{
    [super clickPlusButton:sender];
    [self plusBoundsWithView:alignmentLayout];
}

@end
