//
//  PuppyViewController.h
//  PuppystaGram
//
//  Created by Ian MacKinnon on 2015-05-21.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuppyViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *bigPuppyView;

@property (nonatomic, strong) NSDictionary *puppyData;

@end
