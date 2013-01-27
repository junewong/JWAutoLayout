//
//  AlignmentViewController.m
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import "AlignmentViewController.h"

@interface AlignmentViewController ()

@end

@implementation AlignmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AlignmentLayout *alignmentLayout = [[AlignmentLayout alloc] initWithFrame:CGRectMake(10, 10, 300, 500)];
    
    UIButton *button1 = [self createSmailButtonWithTitle:@"top left"];
    UIButton *button2 = [self createSmailButtonWithTitle:@"top center"];
    UIButton *button3 = [self createSmailButtonWithTitle:@"top right"];
    
    UIButton *button4 = [self createSmailButtonWithTitle:@"middle left"];
    UIButton *button5 = [self createBigButtonWithTitle:@"middle center"];
    UIButton *button6 = [self createSmailButtonWithTitle:@"middle right"];
    
    UIButton *button7 = [self createSmailButtonWithTitle:@"center left"];
    UIButton *button8 = [self createSmailButtonWithTitle:@"center center"];
    UIButton *button9 = [self createSmailButtonWithTitle:@"center right"];
    
    [alignmentLayout addSubview:button1 alignment:AlignmentLayoutTypeTopLeft];
    [alignmentLayout addSubview:button2 alignment:AlignmentLayoutTypeTopCenter];
    [alignmentLayout addSubview:button3 alignment:AlignmentLayoutTypeTopRight];
    [alignmentLayout addSubview:button4 alignment:AlignmentLayoutTypeMiddleLeft];
    [alignmentLayout addSubview:button5 alignment:AlignmentLayoutTypeMiddleCenter];
    [alignmentLayout addSubview:button6 alignment:AlignmentLayoutTypeMiddleRight];
    [alignmentLayout addSubview:button7 alignment:AlignmentLayoutTypeBottomLeft];
    [alignmentLayout addSubview:button8 alignment:AlignmentLayoutTypeBottomCenter];
    [alignmentLayout addSubview:button9 alignment:AlignmentLayoutTypeBottomRight];
    
    [self.view addSubview:alignmentLayout];
}

- (UIButton*)createSmailButtonWithTitle:(NSString*)title
{
    return [self createButtonWithWidth:40.f height:40.f title:title];
}

- (UIButton*)createBigButtonWithTitle:(NSString*)title
{
    return [self createButtonWithWidth:70.f height:70.f title:title];
}

@end
