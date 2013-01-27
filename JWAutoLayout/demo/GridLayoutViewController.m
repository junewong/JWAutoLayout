//
//  GridLayoutViewController.m
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import "GridLayoutViewController.h"

@interface GridLayoutViewController ()

@end

@implementation GridLayoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tipLabel.text = NSLocalizedString(@"tips_gridlayout_demo", @"");
    
    GridLayout *gridLayout = [[GridLayout alloc] init];
    gridLayout.padding_top = 10.0f;
    gridLayout.padding_left = 20.0f;
    gridLayout.columns = 3; // set 3 views each row
    gridLayout.interval_horizontal = 10.0f;
    gridLayout.interval_vertical = 12.0f;
    
    // create and add some views:
    for (int i=0; i < 11; i++) {
        NSString *text = [NSString stringWithFormat:@"%d", i+1];
        UIButton *button = [self createButtonWithTitle:text];
        // add each subview:
        [gridLayout addSubview:button];
    }
    
    [self.contentView addSubview:gridLayout];
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
