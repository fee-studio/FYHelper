//
//  DataViewController.m
//  FYHelperDemoPod
//
//  Created by xiaojia on 02/07/2017.
//  Copyright (c) 2017 xiaojia. All rights reserved.
//

#import "DataViewController.h"


@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];

}


@end