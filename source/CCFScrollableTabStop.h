/**
 *   @file CCFScrollableTabStop.h
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 01:55:59
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

enum {
    CCFScrollableTabStopRight,
    CCFScrollableTabStopLeft
};
typedef NSInteger CCFScrollableTabStopSide; 

@protocol CCFScrollableTabStopDelegate;

/** Scrollable tab stop
 A UIView subclass that draws an arrow on either side of the view for facilitated scrolling.
 */
@interface CCFScrollableTabStop : UIView

/** Highlighted
 Defines the highlighting state of the tab stop.  Only one tab stop (the right or the left) can be highlighted at a given time.
 */
@property (nonatomic, assign, getter = isHighlighted) BOOL highlighted;

/** Side
 The sidedness of the tab stop.  The righthand stop has a value of the CCFScrollableTabStopRight, whereas its contralateral stop is CCFScrollableTabStopLeft.
 */
@property (nonatomic, assign) CCFScrollableTabStopSide side;

/** Delegate
 An object that receives messages of the CCFScrollableTabStopDelegate protocol
 */
@property (nonatomic, weak) id <CCFScrollableTabStopDelegate> delegate;

///---------------------------------------------------------------------------------------
/// @name Initialization
///---------------------------------------------------------------------------------------

/** Designated initializer
 Returns an instnace of the class given a frame, color information dictionary and the side of the stop
 
 @param frame A CGRect that defines the frame of the stop.
 @param colorInfo An NSDictionary that contains the colors to use for the stop.  It should have the following keys: kCCFScrollableTabLightColor and kCCFScrollableTabDarkColor.
 @param aSide The sidedness of the stop as a CCFScrollableTabStopSide parameter
 
 @return Returns a newly initialized instance of the class.
 */
- (id)initWithFrame:(CGRect)frame colorInfo:(NSDictionary *)colorInfo side:(CCFScrollableTabStopSide)aSide;

@end
