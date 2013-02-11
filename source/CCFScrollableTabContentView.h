/**
 *   @file CCFScrollableTabContentView.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-08 16:17:29
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTabDelegate.h"

@protocol CCFScrollableTabContentViewDelegate;
@class CCFScrollableTab;

/** CCFScrollableTabContentView
 The content view for the CCFScrollableTabScrollView, containing one or more CCFScrollableTab instances.
 */
@interface CCFScrollableTabContentView : UIView <CCFScrollableTabDelegate>

/** Delegate
 The object that responds to messages of the CCFScrollableTabContentViewDelegate on our behalf.
 */
@property (nonatomic, weak) id <CCFScrollableTabContentViewDelegate> delegate;

///---------------------------------------------------------------------------------------
/// @name Initialization
///---------------------------------------------------------------------------------------

/** Designated initializer
 The designated initializer for the class.
 
 @param frame The frame in which to draw the view.
 @param titles An NSArray containing localized strings for the text at each tab in order.
 @param colorInfo An NSDictionary containing information about the colors to use for the view.  The keys that must be included are: kCCFScrollableTabLightColor, kCCFScrollableTabDarkColor, and kCCFScrollableTabTextColor.
 
 @return A new instance of the class.
 */
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titles colorInfo:(NSDictionary *)colorInfo;

///---------------------------------------------------------------------------------------
/// @name Selection
///---------------------------------------------------------------------------------------

/** Item selection
 Selects tab item at given index
 
 @param index The index of the tab to select
 */
- (void)selectItemAtIndex:(NSInteger)index;

/** Item at index
 Returns the tab item at the provided index
 
 @param index The index whose tab is requested
 
 @return The CCFScrollableTab object at the given index.
 */
- (CCFScrollableTab *)tabAtIndex:(NSInteger)index;

@end
