//
//  CCFViewController.h
//  CCFScrollingTabBar
//
//  Created by Duncan Alan on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCFScrollableTabDelegate.h"
#import "CCFScrollableTabViewDelegate.h"
#import "CCFScrollableTabViewDataSource.h"

@class CCFScrollableTabView;

@interface CCFViewController : UIViewController <CCFScrollableTabViewDataSource,CCFScrollableTabViewDelegate>

@property (nonatomic, weak) IBOutlet UILabel *textLabel;
@property (nonatomic, weak) IBOutlet CCFScrollableTabView *tabStrip;

@end
