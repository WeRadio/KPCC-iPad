//
//  SCPRCloakViewController.m
//  KPCC
//
//  Created by Hochberg, Ben on 9/24/13.
//  Copyright (c) 2013 scpr. All rights reserved.
//

#import "SCPRCloakViewController.h"
#import "SCPRFloatingEmbedViewController.h"
#import "SCPRScrollingAssetViewController.h"

@interface SCPRCloakViewController ()

@end

@implementation SCPRCloakViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
#ifdef DEBUG
  self.view.backgroundColor = [[DesignManager shared] turquoiseCrystalColor:0.66];
#endif
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Rotatable
- (void)handleRotationPre {
  if ( self.cloakContent ) {
    
    if ( [self.cloakContent isKindOfClass:[SCPRFloatingEmbedViewController class]] ) {
      
    }
    if ( [self.cloakContent isKindOfClass:[SCPRScrollingAssetViewController class]] ) {
      
      SCPRScrollingAssetViewController *savc = (SCPRScrollingAssetViewController*)self.cloakContent;
      [UIView animateWithDuration:0.22 animations:^{
        [savc.view setAlpha:0.0];
      }];
    }
    
  }
}

- (void)handleRotationPost {
  if ( self.cloakContent ) {
    
    if ( [self.cloakContent isKindOfClass:[SCPRFloatingEmbedViewController class]] ) {
      
      SCPRFloatingEmbedViewController *embed = (SCPRFloatingEmbedViewController*)self.cloakContent;
      embed.view.center = CGPointMake(self.view.frame.size.width/2.0,
                                      self.view.frame.size.height/2.0);
      
      
    }
    if ( [self.cloakContent isKindOfClass:[SCPRScrollingAssetViewController class]] ) {
      SCPRScrollingAssetViewController *savc = (SCPRScrollingAssetViewController*)self.cloakContent;
      SCPRScrollingAssetViewController *newAssetController = [[SCPRScrollingAssetViewController alloc]
                                                              initWithNibName:[[DesignManager shared]
                                                                               xibForPlatformWithName:@"SCPRScrollingAssetViewController"]
                                                              bundle:nil];
      newAssetController.view.frame = newAssetController.view.frame;
      [newAssetController sourceWithArticle:savc.article];
      [self.view addSubview:newAssetController.view];
      
      newAssetController.view.center = CGPointMake(self.view.frame.size.width/2.0,
                                                   self.view.frame.size.height/2.0);
      
      [savc deactivate];
      
      self.cloakContent = newAssetController;
      [[Utilities del] setSlideshowModal:self.cloakContent];
      
    }
    
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
