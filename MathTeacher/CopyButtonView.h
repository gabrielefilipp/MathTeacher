//
//  CopyButtonView.h
//  MathTeacher
//
//  Created by gabriele filipponi on 12/06/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CopyButtonView : UIView
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *backgColor;
@property (nonatomic, assign) CGFloat perc;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) NSMutableDictionary<NSString *, UIGestureRecognizer *>*gestures;
-(id)initWithStrokeColor:(UIColor *)color backgroundColor:(UIColor *)back diagonalLenghtPerc:(CGFloat)perc cornerRadius:(CGFloat)radius lineWidth:(CGFloat)line;
-(void)addTarget:(id)target action:(SEL)action withGestureRecognizerClass:(Class)c withKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
