//
//  UIViewController+VirSidePanel.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/28.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "UIViewController+VirSidePanel.h"
#import "VirSidePanelViewController.h"
@implementation UIViewController (VirSidePanel)


-(VirSidePanelViewController *)sidePanelController{
    UIViewController * iter = self.parentViewController;
    while (iter) {
        if ([iter isKindOfClass:[VirSidePanelViewController class]]) {
            return (VirSidePanelViewController *)iter;
        }else if (iter.parentViewController && iter!= iter.parentViewController){
            iter = iter.parentViewController;
        }else{
            iter = nil;
        }
    }
    return  nil;
}
@end
