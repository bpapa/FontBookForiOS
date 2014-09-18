//
//  DetailViewController.h
//  FontBookForiOS
//
//  Created by Brian Papa on 9/18/14.
//  Copyright (c) 2014 bpm apps LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

