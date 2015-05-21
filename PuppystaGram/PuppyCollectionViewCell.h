//
//  PuppyCollectionViewCell.h
//  PuppystaGram
//
//  Created by Ian MacKinnon on 2015-05-21.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PuppyCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView *puppyView;

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;

@end
