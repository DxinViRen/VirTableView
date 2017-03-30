//
//  VirTableViewCellItem.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VirTableViewCellItem : NSObject

/*对应的cell的高度*/
@property(nonatomic,assign)CGFloat cellHeight;

@property(nonatomic,strong)NSMutableArray * childItems;
@property(nonatomic,copy)NSString * cellTitle;
@property(nonatomic,copy)NSString * imageUrl;

@end
