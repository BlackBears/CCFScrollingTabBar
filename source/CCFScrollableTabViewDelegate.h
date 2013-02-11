/**
 *   @file CCFScrollableTabViewDelegate.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 04:21:30
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

@class CCFScrollableTabView;

/** CCFScrollableTabViewDelegate
 This protocol describes the required methods that delegates of CCFScrollableTabView must implement
 */
@protocol CCFScrollableTabViewDelegate <NSObject>

/** Item selection
 This method notifies that the delegate of CCFScrollableTabView that an item was selected
 
 @param tabView The CCFScrollableTabView instance that is sending the message
 @param index The index of the item that was selected.
 
*/
- (void)scrollableTabView:(CCFScrollableTabView *)tabView didSelectItemAtIndex:(NSInteger)index;

@end
