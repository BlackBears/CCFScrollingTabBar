/**
 *   @file CCFScrollableTabContentView.m
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-08 16:17:34
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTabContentView.h"
#import "CCFScrollableTabContentViewDelegate.h"
#import "CCFScrollableTab.h"
#import <QuartzCore/QuartzCore.h>

@implementation CCFScrollableTabContentView {
    NSArray *_titles;
    NSMutableArray *_tabs;
}

#pragma mark - Synthesized properties

@synthesize delegate = _delegate;

#pragma mark - Class methods

+ (Class)layerClass; {
    return [CAGradientLayer class];
}

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titles colorInfo:(NSDictionary *)colorInfo {
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 1200, 41)];
    if( !self ) return nil;
    
    CAGradientLayer *layer = (CAGradientLayer *)self.layer;
    UIColor *darkColor = [colorInfo objectForKey:kCCFScrollableTabDarkColor];
    UIColor *lightColor = [colorInfo objectForKey:kCCFScrollableTabLightColor];
    NSMutableArray *mutableColors = [NSMutableArray arrayWithCapacity:3];
    [mutableColors addObject:(id)lightColor.CGColor];
    [mutableColors addObject:(id)darkColor.CGColor];
    layer.colors = mutableColors;

    //  keep our tab subviews
    _tabs = [NSMutableArray arrayWithCapacity:[titles count]];
    
    __block CGFloat currentPosition = 20.0;
    [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat itemWidth = [CCFScrollableTab widthForText:obj];
        CGRect tabFrame = CGRectMake(currentPosition, 0.0, itemWidth, 41.0f);
        CCFScrollableTab *tab = [[CCFScrollableTab alloc] initWithFrame:tabFrame title:obj colorInfo:colorInfo index:idx];
        tab.location = currentPosition;
        tab.delegate = self;
        [_tabs addObject:tab];
        [self addSubview:tab];
        currentPosition += itemWidth + 7.0f;
    }];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, currentPosition + 20.0f, self.frame.size.height);
    return self;
}

#pragma mark - Public

- (void)selectItemAtIndex:(NSInteger)index {
    //  deselect any others
    [_tabs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if( idx != index  )
            [obj setSelected:NO];
    }];
    [_delegate scrollableTabContentView:self didSelectItemAtIndex:index];
}

- (CCFScrollableTab *)tabAtIndex:(NSInteger)index {
    return _tabs[index];
}

#pragma mark - CCFScrollableTabDelegate

- (void)scrollableTabDidSelectItemAtIndex:(NSInteger)index;
{
    //  deselect any others
    [_tabs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if( idx != index  )
            [obj setSelected:NO];
    }];
    [_delegate scrollableTabContentView:self didSelectItemAtIndex:index];
}

@end
