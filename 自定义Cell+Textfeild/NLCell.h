//
//  NLCell.h
//  自定义Cell+Textfeild
//
//  Created by 张英建 on 2017/1/8.
//  Copyright © 2017年 张英建. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLCell : UITableViewCell

@property(nonatomic,retain)UITextField *tf;

@property(nonatomic,retain)UILabel *lab;

-(void)setTitleString:(NSString *)title andDataSourceString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath;


@end
