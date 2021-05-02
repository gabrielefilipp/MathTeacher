//
//  StackItem.m
//  MathTeacher
//
//  Created by gabriele filipponi on 14/06/2019.
//

#import "StackItem.h"

@implementation StackItem

-(id)init {
    if ((self = [super init])) {
        _next = NULL;
        _previous = NULL;
        _value = @"0";
        _type = buttonTypeNumber;
    }
    return self;
}

@end
