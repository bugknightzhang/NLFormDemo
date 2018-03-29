//
//  UITextField+Customer_IndexPath.m
//  自定义Cell+Textfeild
//
//  Created by 张英建 on 2017/1/8.
//  Copyright © 2017年 张英建. All rights reserved.
//

#import "UITextField+Customer_IndexPath.h"
#import <objc/runtime.h>

@implementation UITextField (Customer_IndexPath)

static char indexPathKey;

-(NSIndexPath *)indexPath
{
    return objc_getAssociatedObject(self, &indexPathKey);
}

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
