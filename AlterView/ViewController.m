//
//  ViewController.m
//  AlterView
//
//  Created by MOYO on 2019/7/19.
//  Copyright © 2019年 MOYO. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlterView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    
    [self.view addSubview:({
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
        btn.backgroundColor = [UIColor orangeColor];
        [btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
        btn;
    })];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tap{
    [self.view addSubview:({
        CustomAlterView *alter = [[CustomAlterView alloc]initWithFrame:self.view.bounds];
        [alter show];
        alter;
    })];
}

@end
