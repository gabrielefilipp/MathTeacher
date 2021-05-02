//
//  WelcomeViewController.h
//  MathTeacher
//
//  Created by gabriele filipponi on 17/06/2019.
//

#import <UIKit/UIKit.h>
#import "ImageLabelDescriptionView.h"
#import "ImageDrawer.h"

NS_ASSUME_NONNULL_BEGIN

@interface WelcomeViewController : UIViewController {
    ImageDrawer *_drawer;
    UIViewController *_target;
}
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSMutableArray<ImageLabelDescriptionView*>*descriptions;
@property (nonatomic, strong) UIButton *dismissButton;
-(id)initWithTargetViewController:(UIViewController *)target;
@end

NS_ASSUME_NONNULL_END
