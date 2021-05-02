//
//  CopyButtonView.m
//  MathTeacher
//
//  Created by gabriele filipponi on 12/06/2019.
//

#import "CopyButtonView.h"

@implementation CopyButtonView

-(id)initWithStrokeColor:(UIColor *)color backgroundColor:(UIColor *)back diagonalLenghtPerc:(CGFloat)perc cornerRadius:(CGFloat)radius lineWidth:(CGFloat)line {
    if ((self = [super init])) {
        _color = color;
        _backgColor = back;
        _perc = perc;
        _radius = radius;
        _lineWidth = line;
        _gestures = [[NSMutableDictionary alloc] init];
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)addTarget:(id)target action:(SEL)action withGestureRecognizerClass:(nonnull Class)c withKey:(NSString *)key {
    UIGestureRecognizer *gesture = [[c alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
    [_gestures setObject:gesture forKey:key];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGFloat s = rect.size.width * _perc * sqrt(2);
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(_lineWidth / 2.0, _lineWidth / 2.0, s - _lineWidth, s - _lineWidth) cornerRadius: _radius];
    [_color setStroke];
    rectanglePath.lineWidth = _lineWidth;
    [rectanglePath stroke];
    
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(rect.size.width - s + _lineWidth / 2.0, rect.size.width - s + _lineWidth / 2.0, s - _lineWidth, s - _lineWidth) cornerRadius: _radius];
    [_backgColor setFill];
    [rectangle2Path fill];
    [_color setStroke];
    rectangle2Path.lineWidth = _lineWidth;
    [rectangle2Path stroke];
}

@end
