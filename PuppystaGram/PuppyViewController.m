//
//  PuppyViewController.m
//  PuppystaGram
//
//  Created by Ian MacKinnon on 2015-05-21.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import "PuppyViewController.h"
#import <UIImageView+WebCache.h>

@interface PuppyViewController ()

@end

@implementation PuppyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *puppyUrl = [[[_puppyData objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
    
    [self.bigPuppyView sd_setImageWithURL:[NSURL URLWithString:puppyUrl]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
