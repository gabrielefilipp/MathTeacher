//
//  ImageLabelDescriptionView.m
//  MathTeacher
//
//  Created by gabriele filipponi on 17/06/2019.
//

#import "ImageLabelDescriptionView.h"

@implementation ImageLabelDescriptionView

-(id)initWithImage:(UIImage *)image imageViewSize:(CGSize)size title:(NSString *)title description:(NSString *)description {
    if ((self = [super init])) {
        _size = size;
        _imageView = [[UIImageView alloc] init];
        _imageView.image = image;
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeCenter;
        [self addSubview:_imageView];
        
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", title, description]];
        
        [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15 weight:UIFontWeightSemibold] range:NSMakeRange(0, [title length])];
        [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15 weight:UIFontWeightRegular] range:NSMakeRange([title length] + 1, attr.length - [title length] - 1)];
        
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.attributedText = attr;
        [self addSubview:_label];
    }
    return self;
}

-(CGFloat)preferredHeightWithSize:(CGSize)size {
    CGSize fit = [_label sizeThatFits:CGSizeMake(size.width - _size.width - 10.0, CGFLOAT_MAX)];
    return fmax(_size.height, fit.height);
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _imageView.frame = CGRectMake(0.0, 0.0, _size.width, _size.height);
    CGSize fit = [_label sizeThatFits:CGSizeMake(self.frame.size.width - _size.width - 10.0, CGFLOAT_MAX)];
    _label.frame = CGRectMake(_size.width + 10.0, 0.0, fit.width, fit.height);
}

@end
