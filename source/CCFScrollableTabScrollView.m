//
//  CCFScrollableTabScrollView.m
//  CCFScrollingTabBar
//
//  Created by Duncan Alan on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCFScrollableTabScrollView.h"
#import "CCFScrollableTabContentView.h"
#import "CCFScrollableTabScrollViewDelegate.h"
#import "CCFScrollableTab.h"


@implementation CCFScrollableTabScrollView

#pragma mark - Synthesized properties

@synthesize tabDelegate = _tabDelegate;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titles colorInfo:(NSDictionary *)colorInfo;
{
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    
    CCFScrollableTabContentView *view = [[CCFScrollableTabContentView alloc] initWithFrame:CGRectMake(0, 0, 1200, 41) titles:titles colorInfo:colorInfo];
    view.delegate = self;
    self.contentSize = view.frame.size;
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.alwaysBounceHorizontal = NO;
    self.backgroundColor = [UIColor clearColor];
    
    [self addSubview:view];
    
    return self;
}

- (void)setSelectedIndex:(NSInteger)index {
    [[self subviews] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if( [obj isKindOfClass:[CCFScrollableTabContentView class]] ) {
            CCFScrollableTab *tabToSelect = [obj tabAtIndex:index];
            [tabToSelect setSelected:YES];
            CGFloat horizontalOffset = tabToSelect.location - 20.f;
            if( horizontalOffset < 0.0 )
                horizontalOffset = tabToSelect.location;
            CGPoint offset = (CGPoint){ .x = horizontalOffset, .y = 0 };
            self.contentOffset = offset;
        }
    }];
}

#pragma mark - CCFScrollableTabContentViewDelegate

- (void)scrollableTabContentView:(CCFScrollableTabContentView *)contentView didSelectItemAtIndex:(NSInteger)index;
{
    [_tabDelegate scrollableTabScrollView:self didSelectItemAtIndex:index];
}

@end
