/**
 *   @file CCFScrollableTabScrollView.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 05:01:32
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTabContentViewDelegate.h"

@protocol CCFScrollableTabScrollViewDelegate;

/* CCFScrollableTabScrollView
 The scrollable portion of the view.
 */
@interface CCFScrollableTabScrollView : UIScrollView <CCFScrollableTabContentViewDelegate>

/** Delegate
 The object that receives messages of the CCFScrollableTabScrollViewDelegate protocol on our behalf.
 */
@property (nonatomic, weak) id <CCFScrollableTabScrollViewDelegate> tabDelegate;

///---------------------------------------------------------------------------------------
/// @name Initialization
///---------------------------------------------------------------------------------------

/** Designated initializer
 Returns a newly initialized instance of the class given a frame, set of titles to use, and information about the colors for the view.
 
 @param frame The frame in which to draw the view.
 @param titles An NSArray containing localized strings for the text at each tab in order.
 @param colorInfo An NSDictionary containing information about the colors to use for the view.  The keys that must be included are: kCCFScrollableTabLightColor, kCCFScrollableTabDarkColor, and kCCFScrollableTabTextColor.
 
 @return A new instance of the class.
 */
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titles colorInfo:(NSDictionary *)colorInfo;

///---------------------------------------------------------------------------------------
/// @name Selection
///---------------------------------------------------------------------------------------

/** Set selected item
 Sets the index of the item that should be selected
 
 @param index The index to select
 */
- (void)setSelectedIndex:(NSInteger)index;

@end
