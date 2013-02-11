/**
 *   @file CCFScrollableTabDelegate.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-08 15:47:01
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

@protocol CCFScrollableTabDelegate <NSObject>

- (void)scrollableTabDidSelectItemAtIndex:(NSInteger)index;

@end
