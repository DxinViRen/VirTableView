//
//  UIViewController+VirSidePanel.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/28.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VirSidePanelViewController;
@interface UIViewController (VirSidePanel)
@property(nonatomic,weak,readonly)VirSidePanelViewController * sidePanelController;

@end
