//
//  ImageDrawer.m
//  MathTeacher
//
//  Created by gabriele filipponi on 17/06/2019.
//

#import "ImageDrawer.h"
#import "Header.h"

@implementation ImageDrawer

+(void)drawCalculatorIconWithSize:(CGSize)size {
    CGFloat rectH = 10.0;
    CGFloat buttonsH = 7.5;
    CGFloat spaceV = (size.height - rectH - buttonsH * 3.0) / 3.0;
    CGFloat spaceH = (size.width - buttonsH * 3.0) / 2.0;
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, rectH) cornerRadius:rectH * 0.2];
    [resultColor setFill];
    [rectanglePath fill];
    
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, rectH + spaceV, buttonsH, buttonsH)];
    [cancelColor setFill];
    [ovalPath fill];
    
    UIBezierPath* oval3Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(buttonsH + spaceH, rectH + spaceV, buttonsH, buttonsH)];
    [resultColor setFill];
    [oval3Path fill];
    
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(buttonsH * 2 + spaceH * 2, rectH + spaceV, buttonsH, buttonsH)];
    [resultColor setFill];
    [oval2Path fill];
    
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, rectH + spaceV * 2 + buttonsH, buttonsH, buttonsH)];
    [resultColor setFill];
    [oval4Path fill];
    
    UIBezierPath* oval6Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(buttonsH + spaceH, rectH + spaceV * 2 + buttonsH, buttonsH, buttonsH)];
    [resultColor setFill];
    [oval6Path fill];
    
    UIBezierPath* oval5Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(buttonsH * 2 + spaceH * 2, rectH + spaceV * 2 + buttonsH, buttonsH, buttonsH)];
    [resultColor setFill];
    [oval5Path fill];
    
    UIBezierPath* oval7Path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, rectH + spaceV * 3 + buttonsH * 2, buttonsH, buttonsH)];
    [resultColor setFill];
    [oval7Path fill];
    
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(buttonsH + spaceH, rectH + spaceV * 3 + buttonsH * 2, size.width - (buttonsH + spaceH), buttonsH) cornerRadius:buttonsH / 2.0];
    [resultColor setFill];
    [rectangle2Path fill];
}

+(void)drawGearIconWithSize:(CGSize)size gearThings:(NSUInteger)number {
    CGFloat gearThingH = 5.0;
    CGFloat gearInsideH = 3;
    
    CGFloat gearR = fmin(size.width, size.height) - gearThingH * 2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(gearThingH, gearThingH, gearR, gearR)];
    [resultColor setStroke];
    ovalPath.lineWidth = 3.5;
    [ovalPath stroke];
    
    for (NSUInteger i = 0; i < 3; i++) {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, size.width / 2.0, size.height / 2.0);
        CGContextRotateCTM(context, i * 120 * M_PI / 180);
        
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, -gearInsideH / 2.0, gearR / 2.0, gearInsideH)];
        [resultColor setFill];
        [rectanglePath fill];
        
        CGContextRestoreGState(context);
    }
    
    CGFloat angle = 360.0 / number;
    for (NSUInteger i = 0; i < number; i++) {
        CGContextSaveGState(context);
        
        CGContextTranslateCTM(context, (cos(i * angle * M_PI / 180) * (gearR + 3.5) + (gearR + 3.5)) / 2.0 + 3.25, (sin(i * angle * M_PI / 180) * (gearR + 3.5) + (gearR + 3.5)) / 2.0 + 3.25);
        CGContextRotateCTM(context, i * angle * M_PI / 180 + 90 * M_PI / 180);
        
        UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
        [bezier5Path moveToPoint: CGPointMake(-2, 2.5)];
        [bezier5Path addLineToPoint: CGPointMake(-0.5, -2.5)];
        [bezier5Path addLineToPoint: CGPointMake(0.5, -2.5)];
        [bezier5Path addLineToPoint: CGPointMake(2, 2.5)];
        [bezier5Path addLineToPoint: CGPointMake(-2, 2.5)];
        [bezier5Path closePath];
        bezier5Path.lineCapStyle = kCGLineCapRound;
        
        bezier5Path.lineJoinStyle = kCGLineJoinRound;
        
        [resultColor setFill];
        [bezier5Path fill];
        [resultColor setStroke];
        bezier5Path.lineWidth = 1;
        [bezier5Path stroke];
        
        CGContextRestoreGState(context);
    }
}

+(void)drawDarkModeIconWithSize:(CGSize)size {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Group
    {
        CGContextSaveGState(context);
        CGContextScaleCTM(context, size.width / 50.0, size.width / 50.0);
        
        
        
        //// Bezier 3 Drawing
        UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
        [bezier3Path moveToPoint: CGPointMake(25.53, 0)];
        [bezier3Path addCurveToPoint: CGPointMake(25.53, 0.93) controlPoint1: CGPointMake(25.53, 0.24) controlPoint2: CGPointMake(25.53, 0.55)];
        [bezier3Path addCurveToPoint: CGPointMake(25.53, 1.93) controlPoint1: CGPointMake(25.53, 1.27) controlPoint2: CGPointMake(25.53, 1.61)];
        [bezier3Path addCurveToPoint: CGPointMake(2.08, 25) controlPoint1: CGPointMake(12.43, 2.68) controlPoint2: CGPointMake(2.08, 12.74)];
        [bezier3Path addCurveToPoint: CGPointMake(25.53, 48.07) controlPoint1: CGPointMake(2.08, 37.26) controlPoint2: CGPointMake(12.43, 47.32)];
        [bezier3Path addCurveToPoint: CGPointMake(25.53, 49.07) controlPoint1: CGPointMake(25.53, 48.4) controlPoint2: CGPointMake(25.53, 48.73)];
        [bezier3Path addCurveToPoint: CGPointMake(25.53, 50) controlPoint1: CGPointMake(25.53, 49.4) controlPoint2: CGPointMake(25.53, 49.71)];
        [bezier3Path addCurveToPoint: CGPointMake(0, 25) controlPoint1: CGPointMake(11.28, 49.25) controlPoint2: CGPointMake(0, 38.33)];
        [bezier3Path addCurveToPoint: CGPointMake(25.53, 0) controlPoint1: CGPointMake(0, 11.67) controlPoint2: CGPointMake(11.28, 0.75)];
        [bezier3Path closePath];
        [resultColor setFill];
        [bezier3Path fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(25.53, 34.79)];
        [bezier2Path addCurveToPoint: CGPointMake(15.96, 25.03) controlPoint1: CGPointMake(20.24, 34.79) controlPoint2: CGPointMake(15.96, 30.42)];
        [bezier2Path addCurveToPoint: CGPointMake(25.53, 15.26) controlPoint1: CGPointMake(15.96, 19.63) controlPoint2: CGPointMake(20.24, 15.26)];
        [bezier2Path addCurveToPoint: CGPointMake(25.53, 34.79) controlPoint1: CGPointMake(25.53, 21.62) controlPoint2: CGPointMake(25.53, 28.5)];
        [bezier2Path closePath];
        [resultColor setFill];
        [bezier2Path fill];
        
        
        //// Bezier 7 Drawing
        UIBezierPath* bezier7Path = [UIBezierPath bezierPath];
        [bezier7Path moveToPoint: CGPointMake(50, 25)];
        [bezier7Path addCurveToPoint: CGPointMake(25.53, 50) controlPoint1: CGPointMake(50, 38.81) controlPoint2: CGPointMake(39.05, 50)];
        [bezier7Path addCurveToPoint: CGPointMake(25.53, 44.66) controlPoint1: CGPointMake(25.53, 48.33) controlPoint2: CGPointMake(25.53, 46.54)];
        [bezier7Path addCurveToPoint: CGPointMake(25.53, 34.72) controlPoint1: CGPointMake(25.53, 41.55) controlPoint2: CGPointMake(25.53, 38.19)];
        [bezier7Path addCurveToPoint: CGPointMake(35.05, 25) controlPoint1: CGPointMake(30.79, 34.72) controlPoint2: CGPointMake(35.05, 30.37)];
        [bezier7Path addCurveToPoint: CGPointMake(25.53, 15.28) controlPoint1: CGPointMake(35.05, 19.63) controlPoint2: CGPointMake(30.79, 15.28)];
        [bezier7Path addCurveToPoint: CGPointMake(25.53, 0) controlPoint1: CGPointMake(25.53, 9.71) controlPoint2: CGPointMake(25.53, 4.45)];
        [bezier7Path addCurveToPoint: CGPointMake(50, 25) controlPoint1: CGPointMake(39.05, 0) controlPoint2: CGPointMake(50, 11.19)];
        [bezier7Path closePath];
        [resultColor setFill];
        [bezier7Path fill];
        
        
        
        CGContextRestoreGState(context);
    }

}

-(UIImage*)calculatorIconWithSize:(CGSize)size {
    if (_calculatorIconCache)
        return _calculatorIconCache;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0.0f);
    [ImageDrawer drawCalculatorIconWithSize:size];
    _calculatorIconCache = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _calculatorIconCache;
}

-(UIImage*)gearIconWithSize:(CGSize)size gearThings:(NSUInteger)number {
    if (_gearIconCache)
        return _gearIconCache;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0.0f);
    [ImageDrawer drawGearIconWithSize:size gearThings:number];
    _calculatorIconCache = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _calculatorIconCache;
}

-(UIImage*)darkModeIconWithSize:(CGSize)size {
    if (_darkModeIconCache)
        return _darkModeIconCache;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size.width, size.height), NO, 0.0f);
    [ImageDrawer drawDarkModeIconWithSize:size];
    _calculatorIconCache = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return _calculatorIconCache;
}

@end
