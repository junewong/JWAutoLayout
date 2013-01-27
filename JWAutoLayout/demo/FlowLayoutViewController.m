//
//  FlowLayoutViewController.m
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import "FlowLayoutViewController.h"

@interface FlowLayoutViewController ()

@end

@implementation FlowLayoutViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tipLabel.text = NSLocalizedString(@"tips_flowlayout_demo", @"");
    
    FlowLayout *container = [[FlowLayout alloc] init];
    container.flowDirection = FlowLayoutDirectionVertical; //default
    container.autoInterval = 10.0f;
    container.padding_top = 20.0f;
    container.padding_left = 10.0f;
    
    FlowLayout *rowLayout1 = [self createRowLayout];
    rowLayout1.autoInterval = 5.0f;
    [rowLayout1 addSubview:[self createButtonWithWidth:80.0f]];
    [rowLayout1 addSubview:[self createButtonWithWidth:60.0f]];
    [rowLayout1 addSubview:[self createButtonWithWidth:130.0f]];
    
    FlowLayout *rowLayout2 = [self createRowLayout];
    rowLayout2.autoInterval = 10.0f;
    [rowLayout2 addSubview:[self createButtonWithWidth:60.0f]];
    [rowLayout2 addSubview:[self createButtonWithWidth:130.0f]];
    [rowLayout2 addSubview:[self createButtonWithWidth:75.0f]];
    
    FlowLayout *rowLayout3 = [self createRowLayout];
    [rowLayout3 addSubview:[self createButtonWithWidth:120.0f]];
    [rowLayout3 addInterval:4.0f];
    [rowLayout3 addSubview:[self createButtonWithWidth:80.0f]];
    [rowLayout3 addInterval:20.0f];
    [rowLayout3 addSubview:[self createButtonWithWidth:60.0f]];
    [rowLayout3 addInterval:8.0f];
    
    [container addSubview:rowLayout1];
    [container addSubview:rowLayout2];
    [container addSubview:rowLayout3];
    
    [self.contentView addSubview:container];
}

- (FlowLayout*)createRowLayout
{
    FlowLayout *rowLayout = [[FlowLayout alloc] init];
    rowLayout.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3f];
    rowLayout.flowDirection = FlowLayoutDirectionHorizontal;
    rowLayout.padding_top = 10.0f;
    rowLayout.padding_left = 10.0f;
    rowLayout.padding_right = 10.0f;
    rowLayout.padding_bottom = 10.0f;
    return rowLayout;
}

#pragma mark - click event

- (IBAction)clickMinusButton:(id)sender
{
    [super clickMinusButton:sender];
    
    for (UIButton *button in [self getAllButtons]) {
        [self minusBoundsWithView:button];
    }
}

- (IBAction)clickPlusButton:(id)sender
{
    [super clickPlusButton:sender];
    
    for (UIButton *button in [self getAllButtons]) {
        [self plusBoundsWithView:button];
    }
}



@end
