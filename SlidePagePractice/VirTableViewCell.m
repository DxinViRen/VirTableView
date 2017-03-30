//
//  VirTableViewCell.m
//  SlidePagePractice
//
//  Created by D.xin on 2017/3/29.
//  Copyright © 2017年 D.xin. All rights reserved.
//

#import "VirTableViewCell.h"
#import "VirTableViewCellItem.h"
@implementation VirTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
    
           
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)heightForCellWithCellDataItem:(VirTableViewCellItem *)dataItem {
    
    //根据数据源来自适应行高
    
    //影响行高的数据是文字和图片，
    return  44.0f;
}
-(void)placeCellDataWithItem:(VirTableViewCellItem *)dataItem{
    self.titleLabel.text  = dataItem.cellTitle;
   
    
}
@end
