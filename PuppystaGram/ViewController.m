//
//  ViewController.m
//  PuppystaGram
//
//  Created by Ian MacKinnon on 2015-05-21.
//  Copyright (c) 2015 Ian MacKinnon. All rights reserved.
//

#import "ViewController.h"
#import "PuppyCollectionViewCell.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "PuppyViewController.h"
#import "PuppyHeaderView.h"

@interface ViewController (){
    NSMutableArray *_puppies;
    UICollectionViewFlowLayout *bigLayout;
    UICollectionViewFlowLayout *smallLayout;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *makeSmallButton = [[UIBarButtonItem alloc] initWithTitle:@"make small" style:UIBarButtonItemStylePlain target:self action:@selector(makeSmall)];
    
    self.navigationItem.rightBarButtonItem = makeSmallButton;
    
    bigLayout = [[UICollectionViewFlowLayout alloc] init];
    bigLayout.itemSize = CGSizeMake(140, 140);
    bigLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    bigLayout.minimumInteritemSpacing = 10.0f;
    bigLayout.minimumLineSpacing = 10.0f;
    bigLayout.headerReferenceSize = CGSizeMake(self.puppyCollectionView.frame.size.width, 10.f);
    
    smallLayout = [[UICollectionViewFlowLayout alloc] init];
    smallLayout.itemSize = CGSizeMake(40, 40);
    smallLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    smallLayout.minimumInteritemSpacing = 10.0f;
    smallLayout.minimumLineSpacing = 10.0f;
    smallLayout.headerReferenceSize = CGSizeZero;
    
    [self.puppyCollectionView setCollectionViewLayout:bigLayout];
    
}

-(void)makeSmall{
        
    [smallLayout invalidateLayout];
    [self.puppyCollectionView setCollectionViewLayout:smallLayout];

}

-(void) viewDidAppear:(BOOL)animated{
    [[AFHTTPRequestOperationManager manager] GET:@"https://api.instagram.com/v1/tags/puppies/media/recent?client_id=531009644bc8430a8ac8404c7d713317" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        _puppies = [responseObject objectForKey:@"data"];
        
        [self.puppyCollectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *puppyData = [_puppies objectAtIndex:indexPath.row];
    
    PuppyCollectionViewCell * cell = [self.puppyCollectionView dequeueReusableCellWithReuseIdentifier:@"PuppyCell" forIndexPath:indexPath];
    
    NSString *puppyUrl = [[[puppyData objectForKey:@"images"] objectForKey:@"standard_resolution"] objectForKey:@"url"];
    
    [cell.puppyView sd_setImageWithURL:[NSURL URLWithString:puppyUrl]];
    
    [cell.nameLabel setText:[[puppyData objectForKey:@"user"] objectForKey:@"username"]];
    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *puppyData = [_puppies objectAtIndex:indexPath.row];
    
    PuppyViewController *puppyViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"puppyViewController"];
    puppyViewController.puppyData = puppyData;
    
    [self.navigationController pushViewController:puppyViewController animated:true];
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        PuppyHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PuppyHeader" forIndexPath:indexPath];
        reusableview = headerView;
    }
    
    return reusableview;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_puppies count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
