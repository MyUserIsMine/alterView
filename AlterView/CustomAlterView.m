//
//  CustomAlterView.m
//  AlterView
//
//  Created by MOYO on 2019/7/19.
//  Copyright © 2019年 MOYO. All rights reserved.
//

#import "CustomAlterView.h"



@interface CustomAlterView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIView *alterView;
@property (nonatomic,assign)NSInteger alterHeight;
@property (nonatomic,strong)NSMutableArray *arr;
@property (nonatomic,strong)UITableView *tableView;


@end


@implementation CustomAlterView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _alterHeight = 0;
        self.backgroundColor = [UIColor colorWithRed:2/255 green:2/255 blue:2/255 alpha:0.7];
        _arr = [NSMutableArray array];
        [_arr addObject:@"aaa"];
        [_arr addObject:@"aaa"];
        [_arr addObject:@"aaa"];
        [_arr addObject:@"aaa"];
        [_arr addObject:@"aaa"];
        [self addSubview:({
            _alterView = [[UIView alloc]initWithFrame:
                          CGRectZero];
            _alterView.center = self.center;
            _alterView.backgroundColor = [UIColor whiteColor];
            _alterView.layer.masksToBounds = YES;
            _alterView.layer.cornerRadius = 5;
            _alterView;
        })];
        
        [_alterView addSubview:({
            _tableView = [[UITableView alloc]initWithFrame:_alterView.bounds];
            _tableView.delegate = self;
            _tableView.dataSource = self;
            _tableView;
        })];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}


-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{
       self.alterView.frame = CGRectMake(10, ([UIScreen mainScreen].bounds.size.height-self.alterHeight)/2, [UIScreen mainScreen].bounds.size.width -20, [UIScreen mainScreen].bounds.size.height/2);
        
        self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -20, self.alterView.frame.size.height);
        
       self.alterView.center = self.center;
    }];
}


-(void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.alterView.frame = CGRectZero;
        self.alterView.center = self.center;
        self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width -20, self.alterView.frame.size.height);
    } completion:^(BOOL finished) {
         [self removeFromSuperview];
    }];
}



@end
