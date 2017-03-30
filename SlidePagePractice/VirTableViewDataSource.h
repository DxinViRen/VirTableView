//
//  VirTableViewDataSource.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <Foundation/Foundation.h>




@class VirTableViewCell,VirTableViewCellItem;
typedef void(^virCellBlock)(VirTableViewCell * cell,VirTableViewCellItem * cellItem,NSIndexPath * indexPath);

@interface VirTableViewDataSource : NSObject<UITableViewDataSource>

-(instancetype)_initWithDataSource:(NSArray *)dataSource cellIdentifier:(NSString *)identifier cellHandle:(virCellBlock)handle;

-(VirTableViewCellItem *)_itemIndex:(NSIndexPath *)indexPath;
@end
