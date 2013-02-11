/**
 *   @file CCFScrollableTabContentViewDelegate.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 04:56:41
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

@class CCFScrollableTabContentView;

/** CCFScrollableTabContentViewDelegate protocol
 This protocol declares the required methods that delegates of CCFScrollableTabContentView must implement.
 */
@protocol CCFScrollableTabContentViewDelegate <NSObject>

/** Item selected
 This method is called on the delegate of the content view when an item is selected.
 
 @param contentView The CCFScrollableTabContentView instance that is sending the message.
 @param index The index of the selected tab item.
 */
- (void)scrollableTabContentView:(CCFScrollableTabContentView *)contentView didSelectItemAtIndex:(NSInteger)index;

@end
