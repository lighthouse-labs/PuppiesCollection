//
//  ViewController.h
//  PuppystaGram
//
//  Created by Ian MacKinnon on 2015-05-21.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, weak) IBOutlet UICollectionView* puppyCollectionView;


@end

