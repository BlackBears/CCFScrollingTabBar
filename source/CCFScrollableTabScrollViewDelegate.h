/**
 *   @file CCFScrollableTabScrollViewDelegate.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 05:02:55
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

@class CCFScrollableTabScrollView;

/** CCFScrollableTabScrollViewDelegate
 This protocol declares the required methods that delegates of CCFScrollableTabScrollView must implement
 */
@protocol CCFScrollableTabScrollViewDelegate <NSObject>

/** Item selection
 This method is called on the delegate when the user selects an item
 
 @param scrollView the CCFScrollableTabScrollView that is sending the message
 @param index The index of the selected item
 
 */
- (void)scrollableTabScrollView:(CCFScrollableTabScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index;

@end
