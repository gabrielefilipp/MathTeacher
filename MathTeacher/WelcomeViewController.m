//
//  WelcomeViewController.m
//  MathTeacher
//
//  Created by gabriele filipponi on 17/06/2019.
//

#import "WelcomeViewController.h"
#import "Header.h"

@implementation WelcomeViewController

-(id)initWithTargetViewController:(UIViewController *)target {
    if ((self = [super init])) {
        _target = target;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _drawer = [[ImageDrawer alloc] init];
    _descriptions = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"MathTeacher welcomes you";
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont systemFontOfSize:34 weight:UIFontWeightBold];
    
    [[self view] addSubview:_titleLabel];
    
    CGSize s = CGSizeMake(30, 42);
    
    ImageLabelDescriptionView *first = [[ImageLabelDescriptionView alloc] initWithImage:[_drawer calculatorIconWithSize:s] imageViewSize:CGSizeMake(50, 50) title:@"New Design" description:@"Discover a new wonderful design and layout for the Calculator app."];
    [[self view] addSubview:first];
    [_descriptions addObject:first];
    
    ImageLabelDescriptionView *second = [[ImageLabelDescriptionView alloc] initWithImage:[_drawer gearIconWithSize:CGSizeMake(42, 42) gearThings:15] imageViewSize:CGSizeMake(50, 50) title:@"Fully Customizable" description:@"Enjoy your preferred style and customize every aspect of the Calculator app. To access settings just tap and hold the copy button."];
    [[self view] addSubview:second];
    [_descriptions addObject:second];
    
    ImageLabelDescriptionView *third = [[ImageLabelDescriptionView alloc] initWithImage:[_drawer darkModeIconWithSize:CGSizeMake(42, 42)] imageViewSize:CGSizeMake(50, 50) title:@"Dark Mode" description:@"Toggle Dark Mode to match your personality, by swiping with two fingers to the top or bottom anywhere."];
    [[self view] addSubview:third];
    [_descriptions addObject:third];
    
    _dismissButton = [[UIButton alloc] init];
    _dismissButton.layer.cornerRadius = 8.0;
    [_dismissButton setTitle:@"Continue" forState:UIControlStateNormal];
    [_dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _dismissButton.backgroundColor = resultColor;
    [_dismissButton addTarget:_target action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:_dismissButton];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //CGSize fit = [_titleLabel sizeThatFits:CGSizeMake(self.view.frame.size.width - 40.0, CGFLOAT_MAX)];
    
    CGFloat offset = 30.0;
    
    _titleLabel.frame = CGRectMake(offset, [[UIApplication sharedApplication] keyWindow].safeAreaInsets.top, self.view.frame.size.width - offset * 2.0, 170.0);
    
    _dismissButton.frame = CGRectMake(offset, self.view.frame.size.height - [[UIApplication sharedApplication] keyWindow].safeAreaInsets.bottom - 50.0 - 10.0, self.view.frame.size.width - offset * 2, 50.0);
    
    CGFloat y = _titleLabel.frame.origin.y + _titleLabel.frame.size.height;
    for (ImageLabelDescriptionView *v in _descriptions) {
        CGFloat h = [v preferredHeightWithSize:CGSizeMake(self.view.frame.size.width - offset * 2.0, CGFLOAT_MAX)];
        v.frame = CGRectMake(offset, y, self.view.frame.size.width - offset * 2.0, h);
        y = y + h + 40.0;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
