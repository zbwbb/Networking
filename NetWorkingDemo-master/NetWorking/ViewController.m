//
//  ViewController.m
//  NetWorking
//
//  Created by Yasin on 16/4/27.
//  Copyright © 2016年 Yasin. All rights reserved.
//

#import "ViewController.h"
#import "SearchDataEngine.h"
@interface ViewController ()
@property (nonatomic, strong) YABaseDataEngine *searchDataEngine;
@end

@implementation ViewController

//网络请求怎么自动取消  也可以手动取消
-(void)dealloc{
    // 当view controller 释放的时候，所有生成的 dataengin都要去取消网络请求
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.searchDataEngine cancelRequest];
    //一个接口生成一个 dataengine
    self.searchDataEngine = [SearchDataEngine control:self searchKey:@"关键字" complete:^(id data, NSError *error) {
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        } else {
            NSLog(@"%@",data);
        }
        
    }];
}

@end
