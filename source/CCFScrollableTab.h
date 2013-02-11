/**
 *   @file CCFScrollableTab.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-08 14:25:21
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTabColorKeys.h"

@protocol CCFScrollableTabDelegate;

/** CCFScrollableTab
 The selectable entitled item in the view hierarchy.
 */
@interface CCFScrollableTab : UIView

/** Delegate
 The object that responds to messages from the CCFScrollableTabDelegate protocol on our behalf.
 */
@property (nonatomic, weak) id <CCFScrollableTabDelegate> delegate;

/** Selection
 Returns the selection state for this item
 */
@property (nonatomic, assign, getter = isSelected) BOOL selected;

/** Location
 Returns the horizontal location of the view in its superview
 */
@property (nonatomic, assign) CGFloat location;

///---------------------------------------------------------------------------------------
/// @name Class methods
///---------------------------------------------------------------------------------------

/** Width for text
 Returns the width of the text provided when drawn with the default font
 
 @param sampleText The text to measure
 
 @return The width of the text provided
 */
+ (CGFloat)widthForText:(NSString *)sampleText;

/** Designated initializer
 The designated initializer for the class.
 
 @param frame The frame in which to draw the view.
 @param title An NSString containing a localized title for this item.
 @param colorInfo An NSDictionary containing information about the colors to use for the view.  The keys that must be included are: kCCFScrollableTabLightColor, kCCFScrollableTabDarkColor, and kCCFScrollableTabTextColor.
 
 @return A new instance of the class.
 */
- (id)initWithFrame:(CGRect)frame title:(NSString *)aTitle colorInfo:(NSDictionary *)colorInfo index:(NSInteger)index;

@end
