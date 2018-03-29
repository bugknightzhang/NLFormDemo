//
//  NLCell.m
//  自定义Cell+Textfeild
//
//  Created by 张英建 on 2017/1/8.
//  Copyright © 2017年 张英建. All rights reserved.
//

#import "NLCell.h"
#import "UITextField+Customer_IndexPath.h"

@implementation NLCell
@synthesize tf,lab;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatLayoutAllSubViews];
    }
    return self;
}

-(void)creatLayoutAllSubViews
{
    tf = [[UITextField alloc]initWithFrame:CGRectMake((self.frame.size.width-40)/3+20, 0, (self.frame.size.width-40)/3*2, 44)];
    tf.placeholder = @"请输入文字";
    [self.contentView addSubview:tf];
    
    lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, (self.frame.size.width-40)/3, 44)];
    [self.contentView addSubview:lab];
}

-(void)setTitleString:(NSString *)title andDataSourceString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath
{
    tf.indexPath = indexPath;
    tf.text = dataString;
    lab.text = title;
}

@end
