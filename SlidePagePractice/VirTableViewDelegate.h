//
//  VirTableViewDelegate.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/30.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VirTableViewCell.h"
typedef CGFloat (^cellHeightBlock)(NSIndexPath * indexPath);
@interface VirTableViewDelegate : NSObject<UITableViewDelegate>

@end
