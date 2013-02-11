/**
 *   @file CCFScrollableTabViewDataSource.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 04:17:45
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

@class CCFScrollableTabView;

/*  CCFScrollableTabViewDataSource
 
 This protocol declares the methods that data sources of CCFScrollableTabView must implement in order to provide 
 data in support of its construction.
 */
@protocol CCFScrollableTabViewDataSource <NSObject>

@required
/** Titles in the scrollable tab view
 A required method of the CCFScrollableTabViewDataSource protocol.  Returns an array of titles to use for the tab view.
 The data source is responsible for any localization that needs to occur before returning the strings.
 
 @param tabView The CCFScrollableTabView for which the titles are requested
 
 @return An NSArray instance containing all of the titles that are to be displayed
 */
- (NSArray *)titlesInScrollableTabView:(CCFScrollableTabView *)tabView;

/** Light color for scrollable tab view
 The UIColor instance for the top portion of the background gradient of the scrollable tab view.
 
 @param tabView The CCFScrollableTabView for which the color is requested
 
 @return A UIColor instance to use for the top color of the background gradient
 */
- (UIColor *)lightColorInScrollableTabView:(CCFScrollableTabView *)tabView;

/** Dark color for scrollable tab view
 The UIColor instance for the bottom portion of the background gradient of the scrollable tab view.
 
 @param tabView The CCFScrollableTabView for which the color is requested
 
 @return A UIColor instance to use for the top color of the background gradient
 */
- (UIColor *)darkColorInScrollableTabView:(CCFScrollableTabView *)tabView;

/** Text color for titles in scrollable tab view
 The UIColor instance for the title text in the tab view
 
 @param tabView The CCFScrollableTabView for which the color is requested
 
 @return A UIColor instance to use for the text in the view
 */
- (UIColor *)textColorInScrollableTabView:(CCFScrollableTabView *)tabView;

@end
