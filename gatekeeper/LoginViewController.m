//
//  LoginViewController.m
//  gatekeeper
//
//  Created by Shaun Stehly on 6/26/14.
//  Copyright (c) 2014 youtube. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UILabel *darkOverlay;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passField;
@property (weak, nonatomic) IBOutlet UILabel *signupLink;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

- (IBAction)onLoginButton:(id)sender;
- (IBAction)onTap:(id)sender;
- (IBAction)textEdited;

- (void)loginGood;
- (void)loginBad;
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)hideBar;


@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.loginButton.alpha = .5;
    [self.loginButton setEnabled:NO];
    
    
    // REGISTER METHODS FOR KEYBOARD HIDE/SHOW EVENTS
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loginGood {
    
    [self.loadingIndicator stopAnimating];
    
    // FEED SCREEN
    FeedViewController *feedVC = [[FeedViewController alloc] init];
    UINavigationController *feedNC = [[UINavigationController alloc] initWithRootViewController:feedVC];

    
    // REQUESTS SCREEN
    RequestsViewController *requestsVC = [[RequestsViewController alloc] init];
    UINavigationController *requestsNC = [[UINavigationController alloc] initWithRootViewController:requestsVC];

    
    // MESSAGES SCREEN
    MessagesViewController *messagesVC = [[MessagesViewController alloc] init];
    UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    
    
    // NOTIFICATIONS SCREEN
    NotificationsViewController *notificationsVC = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    
    
    // MORE SCREEN
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    UINavigationController *moreNC = [[UINavigationController alloc] initWithRootViewController:moreVC];
    

    // TABS VISD
    feedNC.tabBarItem.title = @"News Feed";
    feedNC.tabBarItem.image = [UIImage imageNamed:@"FeedTabImg"];
    requestsNC.tabBarItem.title = @"Requests";
    requestsNC.tabBarItem.image = [UIImage imageNamed:@"RequestsTabImg"];
    messagesNC.tabBarItem.title = @"Messages";
    messagesNC.tabBarItem.image = [UIImage imageNamed:@"MessagesTabImg"];
    notificationsNC.tabBarItem.title = @"Notifications";
    notificationsNC.tabBarItem.image = [UIImage imageNamed:@"NotificationsTabImg"];
    moreNC.tabBarItem.title = @"More";
    moreNC.tabBarItem.image = [UIImage imageNamed:@"MoreTabImg"];
    
    
    // TAB BAR CONTROLLER
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[feedNC, requestsNC, messagesNC, notificationsNC, moreNC];
    tabBarController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    
    
    
    [self presentViewController:tabBarController animated:YES completion:nil];
}

- (void)loginBad {
    [self.loadingIndicator stopAnimating];
    self.loginButton.enabled = YES;
    self.emailField.enabled = YES;
    self.passField.enabled = YES;
    self.darkOverlay.alpha = .5;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect password" message:@"Please make sure you typed your password correctly." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}


- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         CGRect loginFrame = self.loginView.frame;
                         loginFrame.origin.y -= 50;
                         self.loginView.frame = loginFrame;
                         
                         CGRect linkFrame = self.signupLink.frame;
                         linkFrame.origin.y -= 100;
                         self.signupLink.frame = linkFrame;
                         
                         //                         self.loginView.frame = CGRectMake(0, self.view.frame.size.height - self.loginView.frame.size.height -60, self.loginView.frame.size.width, self.loginView.frame.size.height);
                         //
                         //                         CGRect linkFrame = self.signupLink.frame;
                         //                         linkFrame.origin.y -= 88;
                         //                         self.signupLink.frame = linkFrame;
                     }
                     completion:nil];
}


- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         CGRect loginFrame = self.loginView.frame;
                         loginFrame.origin.y += 50;
                         self.loginView.frame = loginFrame;
                         
                         CGRect linkFrame = self.signupLink.frame;
                         linkFrame.origin.y += 100;
                         self.signupLink.frame = linkFrame;
                     }
                     completion:nil];
}

- (IBAction)textEdited {
    if (![self.emailField.text isEqual:@""] && ![self.passField.text isEqual:@""]) {
        [self.loginButton setEnabled:YES];
        self.loginButton.alpha = 1;
    }
    else {
        [self.loginButton setEnabled:NO];
        self.loginButton.alpha = .5;
    }
}


- (IBAction)onLoginButton:(id)sender {
    [self.view endEditing:YES];
    [self.loadingIndicator startAnimating];
    self.loginButton.enabled = NO;
    self.emailField.enabled = NO;
    self.passField.enabled = NO;
    
    
    [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.darkOverlay.alpha = 0;
    }
                     completion:^(BOOL finished) {
    if ([self.passField.text isEqualToString:@"password"])
//        [self loginGood];
                    [self performSelector:@selector(loginGood) withObject:nil afterDelay:2];
    else
//        [self loginBad];
            [self performSelector:@selector(loginBad) withObject:nil afterDelay:2];;
    }];
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

-(void)hideBar
{
    self.navigationController.navigationBarHidden = YES;
}

@end
