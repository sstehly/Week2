//
//  MoreViewController.m
//  gatekeeper
//
//  Created by Shaun Stehly on 6/26/14.
//  Copyright (c) 2014 youtube. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"More";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    //left navbar button - option 1
    UIImage *leftButtonImage = [[UIImage imageNamed:@"LeftNavBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:(leftButtonImage) style:(UIBarButtonItemStylePlain) target:(self) action:(nil)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    //right navbar button - option 2
    UIImage *rightButtonImage = [[UIImage imageNamed:@"RightNavBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:(rightButtonImage) style:(UIBarButtonItemStylePlain) target:(self) action:(nil)];
    self.navigationItem.rightBarButtonItem = rightButton;

    //white status bar text
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
