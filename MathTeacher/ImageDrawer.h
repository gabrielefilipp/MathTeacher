//
//  ImageDrawer.h
//  MathTeacher
//
//  Created by gabriele filipponi on 17/06/2019.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageDrawer : NSObject {
    UIImage *_calculatorIconCache;
    UIImage *_gearIconCache;
    UIImage *_darkModeIconCache;
}
+(void)drawCalculatorIconWithSize:(CGSize)size;
+(void)drawGearIconWithSize:(CGSize)size gearThings:(NSUInteger)number;
+(void)drawDarkModeIconWithSize:(CGSize)size gearThings:(NSUInteger)number;
-(UIImage*)calculatorIconWithSize:(CGSize)size;
-(UIImage*)gearIconWithSize:(CGSize)size gearThings:(NSUInteger)number;
-(UIImage*)darkModeIconWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
