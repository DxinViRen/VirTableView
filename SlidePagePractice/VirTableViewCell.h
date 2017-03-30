//
//  VirTableViewCell.h
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VirTableViewCellItem;
@interface VirTableViewCell : UITableViewCell
/*标题*/
@property(nonatomic,strong)UILabel * titleLabel;
/*左边图片*/
@property(nonatomic,strong)UIImageView * leftImageView;

/*cell 的高度有时候需要根据数据具体的内容变化的，*/
+(CGFloat)heightForCellWithCellDataItem:(VirTableViewCellItem *)dataItem;

/*初始化cell的数据*/
-(void)placeCellDataWithItem:(VirTableViewCellItem *)dataItem;
@end

