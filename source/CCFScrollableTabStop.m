//
//  CCFScrollableTabStop.m
//  CCFScrollingTabBar
//
//  Created by Duncan Alan on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCFScrollableTabStop.h"
#import "CCFScrollableTabStopDelegate.h"
#import "CCFScrollableTabColorKeys.h"
#import <QuartzCore/QuartzCore.h>

///---------------------------------------------------------------------------------------
///    Private methods and properties
///---------------------------------------------------------------------------------------
@interface CCFScrollableTabStop()
- (UIColor *)_colorByDarkeningColor:(UIColor *)originalColor;
- (UIBezierPath *)_bezierPathInRect:(CGRect)rect;
- (UIBezierPath *)_triangleBezierPathInRect:(CGRect)rect;
@end

@implementation CCFScrollableTabStop {
    UIColor *_lightColor;
    UIColor *_darkColor;
    
    CCFScrollableTabStopSide _side;
    
    BOOL _highlighted;
}

#pragma mark - Synthesized properties

@synthesize highlighted = _highlighted;
@synthesize side = _side;
@synthesize delegate = _delegate;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame colorInfo:(NSDictionary *)colorInfo side:(CCFScrollableTabStopSide)aSide {
    self = [super initWithFrame:frame];
    if( !self ) return nil;
    
    _lightColor = [colorInfo objectForKey:kCCFScrollableTabLightColor];
    _darkColor = [colorInfo objectForKey:kCCFScrollableTabDarkColor];
    _side = aSide;
    
    self.backgroundColor = [UIColor clearColor];
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectInset(self.bounds, 1, 3)];
    self.layer.shadowPath = path.CGPath;
    
    return self;
}

#pragma mark - Public API

- (void)setHighlighted:(BOOL)highlighted;
{
    _highlighted = highlighted;
    [self setNeedsDisplay];
}

#pragma mark - UIView drawing

- (void)drawRect:(CGRect)rect {
    CGColorSpaceRef colorSoace = CGColorSpaceCreateDeviceRGB();
    const CGFloat locs[2] = {0.0, 1.0};
    NSArray *colors = nil;
    
    if( _highlighted )
    {
        colors = [NSArray arrayWithObjects:(id)[[self _colorByDarkeningColor:_lightColor] CGColor],
                  (id)[[self _colorByDarkeningColor:_darkColor ]CGColor],nil]; 
    }
    else
    {
        colors = [NSArray arrayWithObjects:(id)_lightColor.CGColor,(id)_darkColor.CGColor, nil];
    }
    CGGradientRef gradient = CGGradientCreateWithColors(colorSoace, (__bridge CFArrayRef)colors, locs);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(ctx);
    
    UIBezierPath *path = [self _bezierPathInRect:rect];
    
    CGPathRef pathRef = [path CGPath];
    CGContextAddPath(ctx, pathRef);
    CGContextClip(ctx);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    
    UIBezierPath *trianglePath = [self _triangleBezierPathInRect:rect];
    UIColor *triangleColor = [UIColor whiteColor];
    if( _highlighted )
        triangleColor = [self _colorByDarkeningColor:triangleColor];
    [triangleColor setFill];
    [trianglePath fill];
    
    CGContextRestoreGState(ctx);
    
}

#pragma mark - Private

- (UIColor *)_colorByDarkeningColor:(UIColor *)originalColor {
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents([originalColor CGColor]);
	CGFloat newComponents[4];
    
	int numComponents = CGColorGetNumberOfComponents([originalColor CGColor]);
    
	switch (numComponents)
	{
		case 2:
		{
			//grayscale
			newComponents[0] = oldComponents[0]*0.7;
			newComponents[1] = oldComponents[0]*0.7;
			newComponents[2] = oldComponents[0]*0.7;
			newComponents[3] = oldComponents[1];
			break;
		}
		case 4:
		{
			//RGBA
			newComponents[0] = oldComponents[0]*0.7;
			newComponents[1] = oldComponents[1]*0.7;
			newComponents[2] = oldComponents[2]*0.7;
			newComponents[3] = oldComponents[3];
			break;
		}
	}
    
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
	return retColor;
}

- (UIBezierPath *)_bezierPathInRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    if( _side == CCFScrollableTabStopLeft )
    {
        [path moveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))];
        [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect))];
        [path addQuadCurveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect)) controlPoint:CGPointMake(CGRectGetMaxX(rect) - 10.0, CGRectGetMidY(rect))];
        [path addLineToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))];
        [path closePath];
    }
    else
    {
        [path moveToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect))];
        [path addLineToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))];
        [path addQuadCurveToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect)) controlPoint:CGPointMake(CGRectGetMinX(rect) + 10.0, CGRectGetMidY(rect))];
        [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))];
        [path closePath];
    }
    return path;
}

- (UIBezierPath *)_triangleBezierPathInRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    if( _side == CCFScrollableTabStopRight )
    {
        [path moveToPoint:CGPointMake(11, 14)];
        [path addLineToPoint:CGPointMake(23, 20)];
        [path addLineToPoint:CGPointMake(11, 27)];
        [path closePath];
    }
    else
    {
        [path moveToPoint:CGPointMake(16, 14)];
        [path addLineToPoint:CGPointMake(4, 20)];
        [path addLineToPoint:CGPointMake(16, 26)];
        [path closePath];
    }
    return path;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.highlighted = YES;
    
    //  scroll...
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.highlighted = NO;
    [_delegate tabStopDidReceiveTouch:self];
}

@end
