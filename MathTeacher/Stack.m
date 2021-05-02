//
//  Stack.m
//  MathTeacher
//
//  Created by gabriele filipponi on 14/06/2019.
//

#import "Stack.h"

@implementation Stack

-(id)init {
    if ((self = [super init])) {
        _lastType = buttonTypeNumber;
        _top = [[StackItem alloc] init];
        _bottom = _top;
        _backupString = NULL;
        _pressEnterCount = 0;
    }
    return self;
}

-(StackItem *)findFirstNodeWithType:(buttonType)type {
    StackItem *tmp = _bottom.previous;
    while (tmp) {
        if (tmp.type == type) {
            break;
        }
        tmp = tmp.previous;
    }
    return tmp;
}

-(void)addOrModifyValue:(NSString *)value withButtonType:(buttonType)type {
    if (type == buttonTypePercentage) {
        BOOL flag = NO;
        if (_lastType == buttonTypeOperator) {
            flag = YES;
            [self addOrModifyValue:@"(" withButtonType:buttonTypeNotOverride];
            [self addOrModifyValue:[self findFirstNodeWithType:buttonTypeNumber].value withButtonType:buttonTypeNotOverride];
        }
        [self addOrModifyValue:kD withButtonType:buttonTypeNotOverride];
        [self addOrModifyValue:@"100" withButtonType:buttonTypeNotOverride];
        if (flag) {
            [self addOrModifyValue:kP withButtonType:buttonTypeNotOverride];
            [self addOrModifyValue:[NSString stringWithFormat:@"(-%@)", [self findFirstNodeWithType:buttonTypeNumber].value] withButtonType:buttonTypeNotOverride];
            [self addOrModifyValue:kD withButtonType:buttonTypeNotOverride];
            [self addOrModifyValue:@"100" withButtonType:buttonTypeNotOverride];
            [self addOrModifyValue:@")" withButtonType:buttonTypeNotOverride];
            NSString *operator = [self findFirstNodeWithType:buttonTypeOperator].value;
            [self findFirstNodeWithType:buttonTypeOperator].value = kP;
            [self addOrModifyValue:operator withButtonType:buttonTypeOperator];
        }
    }else{
        if (type == buttonTypeEnter) {
            /*_lastType = buttonTypeNumber;
            _top = [[StackItem alloc] init];
            _bottom = _top;
            
            type = buttonTypeNumber;*/
            
            _backupString = [self constructedString];
            _pressEnterCount = _pressEnterCount + 1;
            if (_lastType == buttonTypeFunctionRepeatable || _lastType == buttonTypeFunctionBeforeRepeatable) {
                StackItem *t = _top;
                while (t) {
                    if (t.type == buttonTypeOperator) {
                        break;
                    }
                    t = t.next;
                }
                if (!t) {
                    _pressEnterCount = 0;
                }
            }
            
            [self adjustMissingParenthesis];
            
            StackItem *t = _bottom;
            NSUInteger diff = 0;
            while (t) {
                if (t.type == buttonTypeParenthesisClose) {
                    diff = diff + 1;
                }else if (t.type == buttonTypeParenthesisOpen) {
                    diff = diff - 1;
                }
                if (diff == 0 && (t.type == buttonTypeOperator || t.type == buttonTypeFunctionRepeatable || t.type == buttonTypeFunctionBeforeRepeatable)) {
                    break;
                }
                t = t.previous;
            }
            
            [self clearStackItem:t.previous];
            
            StackItem *n = [[StackItem alloc] init];
            n.value = value;
            n.type = type;
            n.next = t;
            t.previous = n;
            _top = n;
            
            _lastType = _bottom.type;
        }else{
            _pressEnterCount = 0;
            if ((_lastType == type || (_lastType == buttonTypeNumber && type == buttonTypeParenthesisOpen)) && type != buttonTypeNotOverride && type != buttonTypeFunction && type != buttonTypeFunctionBefore && type != buttonTypeFunctionBeforeRepeatable && !(_lastType == buttonTypeParenthesisOpen && type == buttonTypeParenthesisOpen) && !(_lastType == buttonTypeParenthesisClose && type == buttonTypeParenthesisClose) && !(_lastType == buttonTypeFunction && type == buttonTypeFunction) && !(_lastType == buttonTypeFunctionRepeatable && type == buttonTypeFunctionRepeatable)) {
                _bottom.value = value;
            }else{
                StackItem *n = [[StackItem alloc] init];
                n.value = value;
                n.type = type;
                StackItem *t = _bottom;
                if (type == buttonTypeFunctionBefore || type == buttonTypeFunctionBeforeRepeatable) {
                    BOOL flg = YES;
                    NSUInteger diff = 0;
                    while (t) {
                        if (t.type == buttonTypeNumber) {
                            if (flg) {
                                break;
                            }
                        }else if (t.type == buttonTypeParenthesisClose) {
                            if (flg) {
                                flg = NO;
                            }
                            diff = diff + 1;
                        }else if (t.type == buttonTypeParenthesisOpen) {
                            if (!flg) {
                                diff = diff - 1;
                                if (diff == 0) {
                                    break;
                                }
                            }
                        }
                        t = t.previous;
                    }
                    while (t.previous && (t.previous.type == buttonTypeFunctionBefore || t.previous.type == buttonTypeFunctionBeforeRepeatable)) {
                        t = t.previous;
                    }
                    if (!t) {
                        t = _top;
                    }
                    if (t.previous) {
                        t.previous.next = n;
                    }else{
                        _top = n;
                    }
                    n.previous = t.previous;
                    t.previous = n;
                    n.next = t;
                }else{
                    _bottom.next = n;
                    n.previous = _bottom;
                    _bottom = n;
                }
            }
            _lastType = type;
        }
    }
}

-(void)clearStack {
    _lastType = buttonTypeNumber;
    
    [self clearStackItem:_bottom];
    
    _lastType = buttonTypeNumber;
    _top = [[StackItem alloc] init];
    _bottom = _top;
    _backupString = NULL;
    _pressEnterCount = 0;
}

-(void)clearStackItem:(StackItem *)item {
    StackItem *tmp = item.previous;
    item = NULL;
    if (tmp) {
        [self clearStackItem:tmp];
    }
    tmp = NULL;
}

-(void)printStack {
    [self printItem:_top];
}

-(void)printItem:(StackItem *)item {
    NSLog(@"Item: %@ Value: %@ Type: %ld Next: %@ Previous: %@", item, item.value, item.type, item.next, item.previous);
    if (item != _bottom) {
        [self printItem:item.next];
    }
}

-(buttonType)lastType {
    return _lastType;
}

-(void)adjustMissingParenthesis {
    StackItem *t = _top;
    NSUInteger open = 0;
    NSUInteger close = 0;
    while (t) {
        if (t.type == buttonTypeParenthesisOpen) {
            open = open + 1;
        }else if (t.type == buttonTypeParenthesisClose) {
            close = close + 1;
        }
        t = t.next;
    }
    if (close > open) {
        NSUInteger diff = close - open - 1;
        t = _bottom;
        while (t && diff) {
            if (t.type == buttonTypeParenthesisClose) {
                StackItem *next = t.next;
                StackItem *previous = t.previous;
                previous.next = next;
                t = NULL;
                t = previous;
                diff = diff - 1;
            }
        }
    }else if (close < open) {
        NSUInteger diff = open - close;
        while (diff) {
            [self addOrModifyValue:@")" withButtonType:buttonTypeParenthesisClose];
            diff = diff - 1;
        }
    }
}

-(NSString *)constructedString {
    if (_pressEnterCount == 1) {
        return _backupString;
    }
    NSString *str = @"";
    StackItem *t = _top;
    while (t) {
        if (t.type == buttonTypeNumber && [t.value floatValue] < 0) {
            str = [NSString stringWithFormat:@"%@ (%@)", str, t.value];
        }else{
            str = [NSString stringWithFormat:@"%@ %@", str, t.value];
        }
        t = t.next;
    }
    str = [NSString stringWithFormat:@"%@ =", str];
    return str;
}

@end
