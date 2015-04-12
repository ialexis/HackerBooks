//
//  UIViewController+Navigation.m
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 08/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) wrappedInNavigation{
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self
                   animated:NO];
    return nav;
}

@end
