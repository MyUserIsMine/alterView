//
//  CustomAlterView.m
//  AlterView
//
//  Created by MOYO on 2019/7/19.
//  Copyright © 2019年 MOYO. All rights reserved.
//

#import "CustomAlterView.h"



@interface CustomAlterView()

@property (nonatomic,strong)UIView *alterView;
@property (nonatomic,assign)NSInteger alterHeight;
@end


@implementation CustomAlterView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _alterHeight = 0;
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.5;
        
        [self addSubview:({
            _alterView = [[UIView alloc]initWithFrame:
                          CGRectMake(10, ([UIScreen mainScreen].bounds.size.height-_alterHeight)/2, [UIScreen mainScreen].bounds.size.width - 20, _alterHeight)];
            _alterView.center = self.center;
            _alterView.backgroundColor = [UIColor whiteColor];
            _alterView;
        })];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tap];
    }
    return self;
}



-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{
       self.alterView.frame = CGRectMake(10, ([UIScreen mainScreen].bounds.size.height-self.alterHeight)/2, [UIScreen mainScreen].bounds.size.width -20, 200);
       self.alterView.center = self.center;
    }];
}


-(void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.alterView.frame = CGRectMake(10, ([UIScreen mainScreen].bounds.size.height-self.alterHeight)/2, [UIScreen mainScreen].bounds.size.width -20, 0);
    } completion:^(BOOL finished) {
         [self removeFromSuperview];
    }];
}



@end
