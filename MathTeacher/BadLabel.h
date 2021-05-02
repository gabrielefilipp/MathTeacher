//
//  BadLabel.h
//  MathTeacher
//
//  Created by gabriele filipponi on 12/06/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BadLabel : UILabel
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
-(id)initWithEdgeInsets:(UIEdgeInsets)edgeInsets;
@end

NS_ASSUME_NONNULL_END
