/**
 *   @file CCFScrollableTabView.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 04:13:19
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTabScrollViewDelegate.h"
#import "CCFScrollableTabViewDataSource.h"
#import "CCFScrollableTabViewDelegate.h"
#import "CCFScrollableTabStopDelegate.h"

/** Scrollable tab view
 This is the top-level class in the view hierarchy.  
 */
@interface CCFScrollableTabView : UIView <CCFScrollableTabScrollViewDelegate, CCFScrollableTabStopDelegate, UIScrollViewDelegate>

/** Delegate
 An object that receives messages of the CCFScrollableTabViewDelegate protocol
 */
@property (nonatomic, weak) id <CCFScrollableTabViewDelegate> delegate;

/** Datasource
 An object that receives messages of the CCFScrollableTabViewDataSource protocol
 */
@property (nonatomic, weak) id <CCFScrollableTabViewDataSource> dataSource;

///---------------------------------------------------------------------------------------
/// @name Managing selection
///---------------------------------------------------------------------------------------

/** Set selected segment index
 Sets the index of the selected segment.  As a side effect the appropriate delegate method from the CCFScrollableTabViewDelegate protocol is called.
 @param index The index of the tab to select.
 */
- (void)setSelectedItemIndex:(NSInteger)index;

@end
