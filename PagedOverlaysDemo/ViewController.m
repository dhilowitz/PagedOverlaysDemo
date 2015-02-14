//
//  ViewController.m
//  PagedOverlaysDemo
//
//  Created by David Hilowitz on 2/13/15.
//  Copyright (c) 2015 Decidedly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIPageViewController *_settingsPageViewController;
    UIViewController *_page1ViewController;
    UIViewController *_page2ViewController;
    UIViewController *_page3ViewController;
    NSArray *_settingsViewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialize settings page view controller
    _settingsPageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _settingsPageViewController.dataSource = self;
    
    
    // Add it to the current view controller
    [self addChildViewController:_settingsPageViewController];
    [self.view addSubview:_settingsPageViewController.view];
    [_settingsPageViewController didMoveToParentViewController:self];
    
//    _settingsPageViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - _toolbar.frame.size.height);
    _settingsPageViewController.view.frame = CGRectMake(50, 50, self.view.bounds.size.width - 100, self.view.bounds.size.height - 100);
    
    // Initialize page1 view controller
    _page1ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Page1ViewController"];
    _page1ViewController.view.frame = _settingsPageViewController.view.frame;
    
    // Initialize page2 view controller
    _page2ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Page2ViewController"];
    _page2ViewController.view.frame = _settingsPageViewController.view.frame;
    
    // Initialize page3 view controller
    _page3ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Page3ViewController"];
    _page3ViewController.view.frame = _settingsPageViewController.view.frame;
    
    _settingsViewControllers = @[_page1ViewController, _page2ViewController, _page3ViewController];
    
    [_settingsPageViewController setViewControllers:[NSArray arrayWithObject:_page1ViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)page1ButtonTapped:(id)sender {
    // Show the UIPageViewController
    // Scroll to the appropriate page
}

- (IBAction)page2ButtonTapped:(id)sender {
}

- (IBAction)page3ButtonTapped:(id)sender {
}

#pragma mark - Protocol: 

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger i = [_settingsViewControllers indexOfObject:viewController];
    if (i > 0) {
        i--;
        return _settingsViewControllers[i];
    } else {
        return nil;
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger i = [_settingsViewControllers indexOfObject:viewController];
    if (i < ([_settingsViewControllers count] - 1)) {
        return _settingsViewControllers[i + 1];
    } else {
        return nil;
    }
}

@end
