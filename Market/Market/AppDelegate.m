//
//  AppDelegate.m
//  Market
//
//  Created by 左梓豪 on 16/10/8.
//  Copyright © 2016年 左梓豪. All rights reserved.
//

#import "AppDelegate.h"
#import "LLTabBar.h"
#import "HomeController.h"
#import "CommunityController.h"
#import "CustomerServiceController.h"
#import "ShoppingCartController.h"
#import "BaseNavigationController.h"

@interface AppDelegate ()<LLTabBarDelegate,UIActionSheetDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    HomeController *homeViewController = [[HomeController alloc] init];
    CommunityController *communityController = [[CommunityController alloc] init];
    CustomerServiceController *customerServiceController = [[CustomerServiceController alloc] init];
    ShoppingCartController *shoppingCartController = [[ShoppingCartController alloc] init];
    
    BaseNavigationController *homeNavigation = [[BaseNavigationController alloc] initWithRootViewController:homeViewController];
    BaseNavigationController *communityNavigation = [[BaseNavigationController alloc] initWithRootViewController:communityController];
    BaseNavigationController *customerServiceNavigation = [[BaseNavigationController alloc] initWithRootViewController:customerServiceController];
    BaseNavigationController *shoppingCartNavigation = [[BaseNavigationController alloc] initWithRootViewController:shoppingCartController];
    
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[homeNavigation, communityNavigation, customerServiceNavigation, shoppingCartNavigation];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    LLTabBar *tabBar = [[LLTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    tabBar.tabBarItemAttributes = @[@{kLLTabBarItemAttributeTitle : @"首页", kLLTabBarItemAttributeNormalImageName : @"home_normal", kLLTabBarItemAttributeSelectedImageName : @"home_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"社区", kLLTabBarItemAttributeNormalImageName : @"mycity_normal", kLLTabBarItemAttributeSelectedImageName : @"mycity_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"", kLLTabBarItemAttributeNormalImageName : @"post_normal", kLLTabBarItemAttributeSelectedImageName : @"post_normal", kLLTabBarItemAttributeType : @(LLTabBarItemRise)},
                                    @{kLLTabBarItemAttributeTitle : @"客服", kLLTabBarItemAttributeNormalImageName : @"message_normal", kLLTabBarItemAttributeSelectedImageName : @"message_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)},
                                    @{kLLTabBarItemAttributeTitle : @"购物车", kLLTabBarItemAttributeNormalImageName : @"account_normal", kLLTabBarItemAttributeSelectedImageName : @"account_highlight", kLLTabBarItemAttributeType : @(LLTabBarItemNormal)}];
    tabBar.delegate = self;
    [tabBarController.tabBar addSubview:tabBar];
    
    self.window.rootViewController = tabBarController;
    
    return YES;
}

#pragma mark - LLTabBarDelegate

- (void)tabBarDidSelectedRiseButton {
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %ld", buttonIndex);
}


@end
