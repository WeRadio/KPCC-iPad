//
//  SCPRNewsSectionTableViewController.h
//  KPCC
//
//  Created by John Meeker on 4/28/14.
//  Copyright (c) 2014 scpr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@protocol SCPRNewsSectionDelegate <NSObject>
@optional
- (void)sectionSelected:(NSDictionary *)section;
@end

@interface SCPRNewsSectionTableViewController : UITableViewController

@property (nonatomic,weak) id<SCPRNewsSectionDelegate> sectionsDelegate;
@property (nonatomic,strong) NSMutableArray *categories;
@property (nonatomic,strong) NSString *currentSectionSlug;

@end
