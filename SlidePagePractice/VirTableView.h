//
//  VirTableView.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VirTableViewDataSource.h"

typedef NS_ENUM(NSInteger,VirTableViewStyle){
    VirTableViewStyleMuiltSections = 0,
    VirTableViewStyleSingleSection 
};

@interface VirTableView : UITableView

@property(nonatomic,assign)VirTableViewStyle secnumStyle;

@end
