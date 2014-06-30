//
//  FeedViewController.m
//  gatekeeper
//
//  Created by Shaun Stehly on 6/26/14.
//  Copyright (c) 2014 youtube. All rights reserved.
//

#import "FeedViewController.h"


@interface FeedViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *feedScrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *feedLoadingIndicator;

- (void) showFeed;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Feed";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.feedScrollView.alpha = 0;
    [self.feedLoadingIndicator startAnimating];
    
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
    
    
    [self performSelector:@selector(showFeed) withObject:nil afterDelay:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showFeed {
    self.feedScrollView.alpha = 1;
    [self.feedLoadingIndicator stopAnimating];
}

@end
