//
//  StackItem.h
//  MathTeacher
//
//  Created by gabriele filipponi on 14/06/2019.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    buttonTypeNumber,
    buttonTypeOperator,
    buttonTypePercentage,
    buttonTypeClear,
    buttonTypeClearAll,
    buttonTypeFunction,
    buttonTypeFunctionRepeatable,
    buttonTypeFunctionBefore,
    buttonTypeFunctionBeforeRepeatable,
    buttonTypeParenthesisOpen,
    buttonTypeParenthesisClose,
    buttonTypeNotOverride,
    buttonTypeEnter
} buttonType;

@interface StackItem : NSObject
@property (nonatomic, strong) NSString *value;
@property (nonatomic, assign) buttonType type;
@property (nonatomic, strong) StackItem *next;
@property (nonatomic, strong) StackItem *previous;
@end
