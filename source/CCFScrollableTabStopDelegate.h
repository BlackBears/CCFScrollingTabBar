/**
 *   @file CCFScrollableTabStopDelegate.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 09:24:54
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

@class CCFScrollableTabStop;

@protocol CCFScrollableTabStopDelegate <NSObject>

- (void)tabStopDidReceiveTouch:(CCFScrollableTabStop *)tabStop;

@end
