/**
 *   @file CCFScrollableTab.m
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-08 14:25:13
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTab.h"
#import "CCFScrollableTabDelegate.h"
#import <QuartzCore/QuartzCore.h>

#define TAB_TEXT_FONT [UIFont boldSystemFontOfSize:14.0f]

//  Scaling factors that determine the size of the bubble relative to the text
static const CGFloat BubbleHorizontalScale = 1.20f;
static const CGFloat BubbleVerticalScale = 1.50f;

///---------------------------------------------------------------------------------------
///    Private methods and properties
///---------------------------------------------------------------------------------------
@interface CCFScrollableTab()
- (void)_setupBubbleLayerInFrame:(CGRect)frame textSize:(CGSize)textSize;
- (void)_setupTitleLabelInFrame:(CGRect)frame textSize:(CGSize)textSize text:(NSString *)aTitle;
@end



@implementation CCFScrollableTab
{
    UIColor *_darkColor;
    UIColor *_lightColor;
    UIColor *_textColor;
    
    CAGradientLayer *_bubbleLayer;
    
    NSString *_title;
    
    BOOL _selected;
    NSInteger _index;
}

#pragma mark - Synthesized properties

@synthesize delegate = _delegate;
@synthesize selected = _selected;

#pragma mark - Class methods

+ (CGFloat)widthForText:(NSString *)sampleText;
{
    UIFont *font = TAB_TEXT_FONT;
    CGSize textSize = [sampleText sizeWithFont:font];
    return 1.40 * textSize.width;
}

- (id)initWithFrame:(CGRect)frame title:(NSString *)aTitle colorInfo:(NSDictionary *)colorInfo index:(NSInteger)index;
{
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    
    if( !colorInfo || [colorInfo count] != 3 )
    {
        NSLog(@"%s - ERROR - missing colors",__FUNCTION__);
        return nil;
    }
    
    //  cache title,index, and colors
    _title = aTitle;
    _index = index;
    
    _textColor = [colorInfo objectForKey:kCCFScrollableTabTextColor];
    _darkColor = [colorInfo objectForKey:kCCFScrollableTabDarkColor];
    _lightColor = [colorInfo objectForKey:kCCFScrollableTabLightColor];
    
    UIFont *font = TAB_TEXT_FONT;
    CGSize textSize = [aTitle sizeWithFont:font];
    
    [self _setupBubbleLayerInFrame:frame textSize:textSize];
    [self _setupTitleLabelInFrame:frame textSize:textSize text:aTitle];
    
    //  recognize taps on the item
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:recognizer];

    return self;
}

- (void)setSelected:(BOOL)selected;
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.075];
    _bubbleLayer.hidden = !selected;
    [CATransaction commit];
}

- (void)tapAction:(UIGestureRecognizer *)gestureRecognizer;
{
    self.selected = YES;
    if( _delegate )
    {
        [_delegate scrollableTabDidSelectItemAtIndex:_index];
    }
}

#pragma mark - Private

- (void)_setupBubbleLayerInFrame:(CGRect)frame textSize:(CGSize)textSize;
{
    /*  bubble view */
    CGRect bubbleRect = CGRectMake(0.5f * (frame.size.width - textSize.width * BubbleHorizontalScale),
                                   0.5f * (frame.size.height - textSize.height * BubbleVerticalScale),
                                   textSize.width * BubbleHorizontalScale,
                                   textSize.height * BubbleVerticalScale);
    _bubbleLayer = [CAGradientLayer layer];
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:2];
    [colors addObject:(id)_darkColor.CGColor];
    [colors addObject:(id)_lightColor.CGColor];
    _bubbleLayer.colors = colors;
    _bubbleLayer.frame = bubbleRect;
    _bubbleLayer.cornerRadius = 0.5 * bubbleRect.size.height;
    
    [[self layer] addSublayer:_bubbleLayer];
    
    
    _bubbleLayer.hidden = YES;
}

- (void)_setupTitleLabelInFrame:(CGRect)frame textSize:(CGSize)textSize text:(NSString *)aTitle;
{
    CGRect labelRect = CGRectMake(0.5f * (frame.size.width - textSize.width),
                                  0.5f * (frame.size.height - textSize.height),
                                  textSize.width, textSize.height);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:labelRect];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = _textColor;
    titleLabel.font = TAB_TEXT_FONT;
    titleLabel.text = aTitle;
    
    [self addSubview:titleLabel];
}


@end
