/**
 *   @file CCFScrollableTabView.m
 *   @author Alan Duncan (www.cocoafactory.com)
 *
 *   @date 2012-03-09 04:13:09
 *   @version 1.0
 *
 *   @note Copyright 2011 Cocoa Factory, LLC.  All rights reserved
 */

#import "CCFScrollableTabView.h"
#import "CCFScrollableTabColorKeys.h"
#import "CCFScrollableTabStop.h"
#import "CCFScrollableTabScrollView.h"

#import "CCFScrollableTabScrollViewDelegate.h"
#import <QuartzCore/QuartzCore.h>

static CCFScrollableTabView *commonInit(CCFScrollableTabView *self) {
    CGRect adjustedFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 41);
    self.frame = adjustedFrame;
    
    [self addObserver:self forKeyPath:@"dataSource" options:NSKeyValueObservingOptionNew context:NULL];
    
    return self;
}

///---------------------------------------------------------------------------------------
///    Private methods and properties
///---------------------------------------------------------------------------------------
@interface CCFScrollableTabView()
- (void)_addLeftStop;
- (void)_addRightStop;
- (void)_addScrollView;
- (NSDictionary *)_colorInfo;
@end

@implementation CCFScrollableTabView
{
    CCFScrollableTabScrollView *_scrollView;
    CCFScrollableTabStop *_leftStop;
    CCFScrollableTabStop *_rightStop;
}

#pragma mark - Synthesized properties

@synthesize delegate = _delegate;
@synthesize dataSource = _dataSource;

#pragma mark - Class methods

+ (Class)layerClass {
    return [CAGradientLayer class];
}

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    
    return commonInit(self);
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if( !self ) return nil;
    
    return commonInit(self);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if( [keyPath isEqualToString:@"dataSource"] )
    {
        if( _scrollView )
            [_scrollView removeFromSuperview];
        [self _addScrollView];
        if( _leftStop )
            [_leftStop removeFromSuperview];
        [self _addLeftStop];
        if( _rightStop )
            [_rightStop removeFromSuperview];
        [self _addRightStop];
        
        CAGradientLayer *layer = (CAGradientLayer *)self.layer;
        NSDictionary *colorInfo = [self _colorInfo];
        UIColor *darkColor = [colorInfo objectForKey:kCCFScrollableTabDarkColor];
        UIColor *lightColor = [colorInfo objectForKey:kCCFScrollableTabLightColor];
        NSMutableArray *mutableColors = [NSMutableArray arrayWithCapacity:2];
        [mutableColors addObject:(id)lightColor.CGColor];
        [mutableColors addObject:(id)darkColor.CGColor];
        layer.colors = mutableColors;
    }
}

- (void)_addLeftStop {
    CGRect leftRect = CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), 27, 41);
    _leftStop = [[CCFScrollableTabStop alloc] initWithFrame:leftRect colorInfo:[self _colorInfo] side:CCFScrollableTabStopLeft];
    _leftStop.delegate = self;
    [self addSubview:_leftStop];
}

- (void)_addRightStop {
    CGRect rightRect = CGRectMake(CGRectGetMaxX(self.bounds)-27, CGRectGetMinY(self.bounds), 27, 41);
    _rightStop = [[CCFScrollableTabStop alloc] initWithFrame:rightRect colorInfo:[self _colorInfo] side:CCFScrollableTabStopRight];
    _rightStop.delegate = self;
    [self addSubview:_rightStop];
}

- (void)_addScrollView {
    NSArray *titles = [_dataSource titlesInScrollableTabView:self];
    _scrollView = [[CCFScrollableTabScrollView alloc] initWithFrame:self.bounds titles:titles colorInfo:[self _colorInfo]];
    _scrollView.tabDelegate = self;
    _scrollView.delegate = self;
    [self addSubview:_scrollView];
}

- (NSDictionary *)_colorInfo {
    NSMutableDictionary *mutableColorInfo = [NSMutableDictionary dictionaryWithCapacity:3];
    [mutableColorInfo setObject:[_dataSource textColorInScrollableTabView:self] forKey:kCCFScrollableTabTextColor];
    [mutableColorInfo setObject:[_dataSource lightColorInScrollableTabView:self] forKey:kCCFScrollableTabLightColor];
    [mutableColorInfo setObject:[_dataSource darkColorInScrollableTabView:self] forKey:kCCFScrollableTabDarkColor];
    return mutableColorInfo;
}

#pragma mark - Public

- (void)setSelectedItemIndex:(NSInteger)index {
    [_delegate scrollableTabView:self didSelectItemAtIndex:index];
    [_scrollView setSelectedIndex:index];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    if( offset.x <= 0 )
        _leftStop.hidden = YES;
    else
        _leftStop.hidden = NO;
    if( offset.x + 320 >= _scrollView.contentSize.width )
        _rightStop.hidden = YES;
    else
        _rightStop.hidden = NO;
}

#pragma mark - CCFScrollableTabScrollViewDelegate

- (void)scrollableTabScrollView:(CCFScrollableTabScrollView *)scrollView didSelectItemAtIndex:(NSInteger)index {
    //  pass the selection up the chain
    [_delegate scrollableTabView:self didSelectItemAtIndex:index];
}

#pragma mark - CCFScrollableTabStopDelegate

- (void)tabStopDidReceiveTouch:(CCFScrollableTabStop *)tabStop {
    CGPoint offset = _scrollView.contentOffset;
    CGFloat xOffset;
    if( tabStop.side == CCFScrollableTabStopLeft ) {
        xOffset = offset.x - 50.0;
        if( xOffset < 0 )
            xOffset = 0;
        offset = CGPointMake(xOffset - 50.0, 0.0);
    }
        
    else
    {
        xOffset = offset.x + 50.0;
        if( xOffset + 320 > _scrollView.contentSize.width )
            xOffset = _scrollView.contentSize.width - 320;
        offset = CGPointMake(xOffset, 0.0);
    }
    
    [_scrollView setContentOffset:offset animated:YES];
}

#pragma mark - UI interactions


@end
