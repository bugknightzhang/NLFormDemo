//
//  ViewController.m
//  自定义Cell+Textfeild
//
//  Created by 张英建 on 2017/1/8.
//  Copyright © 2017年 张英建. All rights reserved.
//

#import "ViewController.h"
#import "NLCell.h"
#import "UITextField+Customer_IndexPath.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@property(nonatomic,strong)NSMutableDictionary *dictDataSource;
@property(nonatomic,strong)NSMutableArray *array;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
#pragma mark - 初始化数据
-(void)initData
{
    for (int i = 0; i < 3; i++) {
        NSInteger row = arc4random() % 8+1;
        NSMutableArray *arr = [NSMutableArray array];
        for (int j = 0; j < row; j++) {
            [arr addObject:[NSString stringWithFormat:@"s=%d,r=%d:",i,j]];
        }
        [self.array addObject:arr];
    }
}
#pragma mark - 通知存储数据
-(void)textFieldDidChanged:(NSNotification *)notify
{
    UITextField *textfeild = notify.object;
    NSIndexPath *indexPath = textfeild.indexPath;
    [self.dictDataSource setObject:textfeild.text forKey:_array[indexPath.section][indexPath.row]];
}
#pragma mark - delegate/dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((NSArray *)_array[section]).count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellFlag = @"cellIndex";
    NLCell *cell = [tableView dequeueReusableCellWithIdentifier:cellFlag];
    if (cell == nil) {
        cell = [[NLCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellFlag];
    }
    [cell setTitleString:_array[indexPath.section][indexPath.row] andDataSourceString:self.dictDataSource[_array[indexPath.section][indexPath.row]] andIndexPath:indexPath];
    return cell;
}

#pragma mark - 懒加载
-(NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
-(NSMutableDictionary *)dictDataSource
{
    if (_dictDataSource == nil) {
        _dictDataSource = [NSMutableDictionary dictionary];
    }
    return _dictDataSource;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
