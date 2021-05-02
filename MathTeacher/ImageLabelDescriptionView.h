//
//  ImageLabelDescriptionView.h
//  MathTeacher
//
//  Created by gabriele filipponi on 17/06/2019.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageLabelDescriptionView : UIView {
    CGSize _size;
}
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
-(id)initWithImage:(UIImage *)image imageViewSize:(CGSize)size title:(NSString *)title description:(NSString *)description;
-(CGFloat)preferredHeightWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
