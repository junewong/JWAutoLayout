//
//  ViewController.h
//  JWAutoLayout
//
//  Created by June on 13-1-26.
//  Copyright (c) 2013年 junewong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlowLayoutViewController.h"
#import "GridLayoutViewController.h"
#import "AlignmentLayoutViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (unsafe_unretained, nonatomic) NSArray *titleArray;

@property (unsafe_unretained, nonatomic) IBOutlet UITableView *demoTableView;

@end
