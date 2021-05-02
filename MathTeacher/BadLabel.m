//
//  BadLabel.m
//  MathTeacher
//
//  Created by gabriele filipponi on 12/06/2019.
//

#import "BadLabel.h"
#import "Header.h"

@implementation BadLabel

-(id)initWithEdgeInsets:(UIEdgeInsets)edgeInsets {
    if ((self = [super init])) {
        _edgeInsets = edgeInsets;
    }
    return self;
}

-(void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

-(CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width += self.edgeInsets.left + self.edgeInsets.right;
    size.height += self.edgeInsets.top + self.edgeInsets.bottom;
    return size;
}

/*
-(UIFont *)font {
    return [UIFont fontWithName:fontName size:30];
}

-(void)setFont:(UIFont *)font {
    [super setFont:[UIFont fontWithName:fontName size:30]];
}
*/
@end
