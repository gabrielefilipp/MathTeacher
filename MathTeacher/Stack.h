//
//  Stack.h
//  MathTeacher
//
//  Created by gabriele filipponi on 14/06/2019.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "StackItem.h"

#define kX @"×"
#define kD @"÷"
#define kM @"-"
#define kP @"+"

@interface Stack : NSObject {
    buttonType _lastType;
}
@property (nonatomic, strong) StackItem *top;
@property (nonatomic, strong) StackItem *bottom;
@property (nonatomic, assign) NSUInteger pressEnterCount;
@property (nonatomic, strong) NSString *backupString;
-(id)init;
-(void)addOrModifyValue:(NSString *)value withButtonType:(buttonType)type;
-(void)clearStack;
-(void)printStack;
-(buttonType)lastType;
-(void)adjustMissingParenthesis;
-(NSString *)constructedString;
@end
