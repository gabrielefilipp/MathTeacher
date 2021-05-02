#import "Header.h"

static CGFloat bigWidth;
static UILabel *modeLabel;
static CalculatorController *sharedController;
static NSMutableArray *highlightViews;

static UIColor *colorFromString(NSString *identifier, UIColor *def) {
    NSString *string = [[NSUserDefaults standardUserDefaults] stringForKey:identifier];
    if ([string isEqualToString:@"default"]) {
        return def;
    }else if ([string isEqualToString:@"default"]) {
        return def;
    }else if ([string isEqualToString:@"red"]) {
        return [UIColor redColor];
    }else if ([string isEqualToString:@"orange"]) {
        return [UIColor orangeColor];
    }else if ([string isEqualToString:@"yellow"]) {
        return [UIColor yellowColor];
    }else if ([string isEqualToString:@"green"]) {
        return [UIColor greenColor];
    }else if ([string isEqualToString:@"blue"]) {
        return [UIColor blueColor];
    }else if ([string isEqualToString:@"purple"]) {
        return [UIColor purpleColor];
    }else if ([string isEqualToString:@"brown"]) {
        return [UIColor brownColor];
    }else if ([string isEqualToString:@"black"]) {
        return [UIColor blackColor];
    }else if ([string isEqualToString:@"white"]) {
        return [UIColor whiteColor];
    }
    return def;
}

%group App

%hook Delegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    return %orig;
}

%end

%end

%group Model

%hook CalculatorModel

%property (nonatomic, strong) NSString *lastNumber;
%property (nonatomic, strong) NSString *lastOperator;
%property (nonatomic, strong) Stack *stack;

%new
-(id)displayValue {
    return [self accessibilityDisplayValue];
}

%new
-(id)delegate {
    return MSHookIvar<id>(self, "delegate");
}

%new
-(void)addObject:(id)objc toArray:(NSMutableArray *)array atIndex:(NSUInteger)index {
    if ([array count] == index) {
        [array addObject:objc];
    }else{
        array[index] = objc;
    }
}

%new
-(NSString *)operatorStringFromButtonID:(NSInteger)button {
    if (button >= 5 && button <= 8) {
        if (button == 5) {
            [self setLastOperator:kD];
        }else if (button == 6) {
            [self setLastOperator:kX];
        }else if (button == 7) {
            [self setLastOperator:kM];
        }else if (button == 8){
            [self setLastOperator:kP];
        }
    }
    return [self lastOperator];
}

%new
-(NSString *)functionStringFromButtonID:(NSInteger)button {
    if (button == 28) {
        return @"^2";
    }else if (button == 29) {
        return @"^3";
    }else if (button == 30) {
        return @"^";
    }else if (button == 31) {
        return @"e^";
    }else if (button == 32) {
        return @"10^";
    }else if (button == 33) {
        return [NSString stringWithFormat:@"1%@", kD];
    }else if (button == 34) {
        return @"√";
    }else if (button == 35) {
        return @"∛";
    }else if (button == 36) {
        return [NSString stringWithFormat:@"^1%@", kD];
    }else if (button == 37) {
        return @"ln";
    }else if (button == 38) {
        return @"log10";
    }else if (button == 39) {
        return @"!";
    }else if (button == 40) {
        return @"sin";
    }else if (button == 41) {
        return @"cos";
    }else if (button == 42) {
        return @"tan";
    }else if (button == 46) {
        return @"sinh";
    }else if (button == 47) {
        return @"cosh";
    }else if (button == 48) {
        return @"tanh";
    }else if (button == 54) {
        return @"^^";
    }else if (button == 55) {
        return @"2^";
    }else if (button == 56) {
        return @"log";
    }else if (button == 57) {
        return @"log2";
    }else if (button == 58) {
        return @"sin^(−1)";
    }else if (button == 59) {
        return @"cos^(−1)";
    }else if (button == 60) {
        return @"tan^(−1)";
    }else if (button == 61) {
        return @"sinh^(−1)";
    }else if (button == 62) {
        return @"cosh^(−1)";
    }else if (button == 63) {
        return @"tanh^(−1)";
    }
    return @"";
}

-(void)buttonPressed:(NSInteger)button {
    %orig;
    NSString *value = [[self displayValue] value];
    if (button == 1) {
        [[self stack] addOrModifyValue:@"0" withButtonType:buttonTypeNumber]; //<- Sbagliato parzialmente
    }else if (button == 51) {
        [[self stack] clearStack];
    }else if (button == 3) {
        [[self stack] addOrModifyValue:value withButtonType:buttonTypeNumber];
    }else if (button == 4) {
        [[self stack] addOrModifyValue:@"" withButtonType:buttonTypePercentage];
    }else if (button >= 5 && button <= 8) {
        [[self stack] addOrModifyValue:[self operatorStringFromButtonID:button] withButtonType:buttonTypeOperator];
    }else if (button == 9) {
        //id value = [self valueForKey:@"repeatButton"];
        [[self stack] addOrModifyValue:[self lastNumber] withButtonType:buttonTypeEnter];
    }else if ((button >= 11 && button <= 20) || button == 10 || button == 52 || button == 43 || button == 49 || button == -1) {
        [[self stack] addOrModifyValue:value withButtonType:buttonTypeNumber];
    }else if (button == 21) {
        [[self stack] addOrModifyValue:@"(" withButtonType:buttonTypeParenthesisOpen];
    }else if (button == 22) {
        [[self stack] addOrModifyValue:@")" withButtonType:buttonTypeParenthesisClose];
    }else if (button == 39) {
        [[self stack] addOrModifyValue:[self lastOperator] withButtonType:buttonTypeFunction];
    }else if ((button >= 31 && button <= 33) || (button >= 37 && button <= 38) || (button >= 40 && button <= 42) || (button >= 46 && button <= 48) || (button >= 55 && button <= 63)) {
        [[self stack] addOrModifyValue:[self lastOperator] withButtonType:buttonTypeFunctionBefore];
    }else if (button == 28 || button == 29 || button == 30 || button == 36 || button == 54) {
        [self setLastOperator:[self functionStringFromButtonID:button]];
        [[self stack] addOrModifyValue:[self lastOperator] withButtonType:buttonTypeFunctionRepeatable];
    }else if (button == 34 || button == 35) {
        [self setLastOperator:[self functionStringFromButtonID:button]];
        [[self stack] addOrModifyValue:[self lastOperator] withButtonType:buttonTypeFunctionBeforeRepeatable];
    }
    [self setLastNumber:value];
    [[((DisplayView *)[[[self delegate] displayController] view]) historyLabel] setText:[[self stack] constructedString]];
}

%end

%end

%group Value

%hook DisplayValue

%new
-(NSString *)value {
    return [self accessibilityStringValue];
}

%end

%end

%group Window

%hook CalculatorWindow

-(UIColor *)backgroundColor {
    return backColor;
}

-(void)setBackgroundColor:(UIColor *)color {
    %orig(backColor);
}

%end

%end

%group RootViewController

%hook CalculatorController

%property (nonatomic, strong) WelcomeViewController *welcomeController;
%property (nonatomic, strong) UIImageView *fakeImageView;
%property (nonatomic, strong) UIImpactFeedbackGenerator *feedbackGenerator;
%property (nonatomic, strong) UINavigationController *settingsController;

-(id)initWithNibName:(id)name bundle:(id)bundle {
    sharedController = %orig;
    [sharedController setFeedbackGenerator:[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]];
    return sharedController;
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kDarkMode] && ![self settingsController]) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

%new
-(id)model {
    return MSHookIvar<id>(self, "model");
}

%new
-(id)displayController {
    return [self accessibilityDisplayController];
}

%new
-(id)keypadController {
    return [self accessibilityKeypadController];
}

-(void)viewDidLoad {
    %orig;
    NSString *value = [[((CalculatorModel *)[self model]) displayValue] value];
    [((CalculatorModel *)[self model]) setStack:[[Stack alloc] init]];
    [[((CalculatorModel *)[self model]) stack] addOrModifyValue:value withButtonType:buttonTypeNumber];
    [[((DisplayView *)[[self displayController] view]) historyLabel] setText:[[((CalculatorModel *)[self model]) stack] constructedString]];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(toggleColorMode:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp ;
    swipeUp.numberOfTouchesRequired = 2;
    [[self view] addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(toggleColorMode:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    swipeDown.numberOfTouchesRequired = 2;
    [[self view] addGestureRecognizer:swipeDown];
}

-(void)viewDidAppear:(BOOL)animated {
    %orig;
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kWelcome]) {
        [self setWelcomeController:[[WelcomeViewController alloc] init]];
        [self addChildViewController:[self welcomeController]];
        
        [[self view] addSubview:[[self welcomeController] view]];
        [[[self welcomeController] view] setFrame:CGRectMake(0, [self view].frame.size.height, [self view].frame.size.width, [self view].frame.size.height)];
        
        [UIView animateWithDuration:0.25 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [[[self welcomeController] view] setFrame:CGRectMake(0, 0, [self view].frame.size.width, [self view].frame.size.height)];
        }completion:nil];
    }
}

%new
-(void)showSettingsController {
    if (![self settingsController]) {
        NSInteger support = [[UIDevice currentDevice] _feedbackSupportLevel];
        if (support >= 2) {
            [[self feedbackGenerator] prepare];
            [((UIImpactFeedbackGenerator *)[self feedbackGenerator]) impactOccurred];
        }else if (support == 1) {
            AudioServicesPlaySystemSound(SystemSoundID(1519));
        }else{
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate));
        }
        
        PSListController *controller = [[MathTeacherPreferencesController alloc] init];
        [controller setTitle:@"Settings"];
        [self setSettingsController:[[UINavigationController alloc] initWithRootViewController:controller]];
        
        [[controller navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonSystemItemDone target:self action:@selector(dismissSettingsController)]];
        
        [self addChildViewController:[self settingsController]];
        [[self view] addSubview:[[self settingsController] view]];
        
        [[[self settingsController] view] setFrame:CGRectMake(0, [self view].frame.size.height, [self view].frame.size.width, [self view].frame.size.height)];
        
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [[[self settingsController] view] setFrame:CGRectMake(0, 0, [self view].frame.size.width, [self view].frame.size.height)];
        }completion:^(BOOL finished) {
            [self setNeedsStatusBarAppearanceUpdate];
        }];
    }
}

%new
-(void)dismissWelcomeController {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:kWelcome];
    [userDefaults synchronize];
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[[self welcomeController] view] setFrame:CGRectMake(0, [self view].frame.size.height, [self view].frame.size.width, [self view].frame.size.height)];
    }completion:^(BOOL finished) {
        [[[self welcomeController] view] removeFromSuperview];
        [[self welcomeController] removeFromParentViewController];
        [self setWelcomeController:NULL];
    }];
}

%new
-(void)dismissSettingsController {
    [self updateUI];
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[[self settingsController] view] setFrame:CGRectMake(0, [self view].frame.size.height, [self view].frame.size.width, [self view].frame.size.height)];
    }completion:^(BOOL finished) {
        [[[self settingsController] view] removeFromSuperview];
        [[self settingsController] removeFromParentViewController];
        [self setSettingsController:NULL];
        [self setNeedsStatusBarAppearanceUpdate];
    }];
}

%new
-(void)updateUI {
    [[[UIApplication sharedApplication] keyWindow] setBackgroundColor:[UIColor whiteColor]];
    [[[self displayController] view] setBackgroundColor:[UIColor whiteColor]];
    [[((DisplayView *)[[self displayController] view]) valueLabel] setTextColor:[UIColor whiteColor]];
    [[((DisplayView *)[[self displayController] view]) valueForKey:@"modeLabel"] setTextColor:[UIColor whiteColor]];
    
    ((CopyButtonView *)[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"]).backgColor = backColor;
    
    [[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"] setNeedsDisplay];
    [[[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"] layer] displayIfNeeded];
    
    for (CalculatorKeypadButton *button in [[[self keypadController] basicKeypad] buttons]) {
        [button setNeedsDisplay];
        [[button layer] displayIfNeeded];
    }
    for (CalculatorKeypadButton *button in [[[self keypadController] scientificKeypad] buttons]) {
        [button setNeedsDisplay];
        [[button layer] displayIfNeeded];
    }
    for (UIView *v in highlightViews) {
        [v setNeedsDisplay];
        [[v layer] displayIfNeeded];
    }
}

%new
-(void)toggleColorMode:(UISwipeGestureRecognizer *)gesture {
    NSInteger support = [[UIDevice currentDevice] _feedbackSupportLevel];
    if (support >= 2) {
        [[self feedbackGenerator] prepare];
        [((UIImpactFeedbackGenerator *)[self feedbackGenerator]) impactOccurred];
    }else if (support == 1) {
        AudioServicesPlaySystemSound(SystemSoundID(1519));
    }else{
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate));
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL darkMode = ![userDefaults boolForKey:kDarkMode];
    [userDefaults setBool:darkMode forKey:kDarkMode];
    [userDefaults synchronize];
    
    if ([[userDefaults stringForKey:kAnimation] isEqualToString:@"fade"]) {
        [UIView animateWithDuration:0.3 animations:^{
            [[[UIApplication sharedApplication] keyWindow] setBackgroundColor:[UIColor whiteColor]];
            [[[self displayController] view] setBackgroundColor:[UIColor whiteColor]];
            [[((DisplayView *)[[self displayController] view]) valueLabel] setTextColor:[UIColor whiteColor]];
            [[((DisplayView *)[[self displayController] view]) valueForKey:@"modeLabel"] setTextColor:[UIColor whiteColor]];
            [self setNeedsStatusBarAppearanceUpdate];
        }];
        
        ((CopyButtonView *)[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"]).backgColor = backColor;
        
        [[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"] setNeedsDisplay];
        [UIView transitionWithView:[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"] duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve  animations:^{
            [[[((DisplayView *)[[self displayController] view]) valueForKey:@"copyButtonView"] layer] displayIfNeeded];
        } completion:nil];
        
        for (CalculatorKeypadButton *button in [[[self keypadController] basicKeypad] buttons]) {
            [button setNeedsDisplay];
            [UIView transitionWithView:button duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve  animations:^{
                [[button layer] displayIfNeeded];
            } completion:nil];
        }
        for (CalculatorKeypadButton *button in [[[self keypadController] scientificKeypad] buttons]) {
            [button setNeedsDisplay];
            [UIView transitionWithView:button duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve  animations:^{
                [[button layer] displayIfNeeded];
            } completion:nil];
        }
        for (UIView *v in highlightViews) {
            [v setNeedsDisplay];
            [UIView transitionWithView:v duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve  animations:^{
                [[v layer] displayIfNeeded];
            } completion:nil];
        }
    }else{
        UIGraphicsBeginImageContextWithOptions([[UIApplication sharedApplication] keyWindow].bounds.size, [[UIApplication sharedApplication] keyWindow].opaque, 0.0f);
        [[[UIApplication sharedApplication] keyWindow] drawViewHierarchyInRect:[[UIApplication sharedApplication] keyWindow].bounds afterScreenUpdates:NO];
        UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImageView *fake = [[UIImageView alloc] init];
        
        fake.layer.masksToBounds = YES;
        
        fake.frame = [self view].bounds;
        fake.image = snapshot;
        
        [fake setUserInteractionEnabled:YES];
        [[self view] addSubview:fake];
        [[self view] bringSubviewToFront:fake];
        
        [self updateUI];
        
        if (gesture.direction == UISwipeGestureRecognizerDirectionUp) {
            fake.contentMode = UIViewContentModeTop;
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                fake.frame = CGRectMake(0.0, 0.0, [self view].frame.size.width, 0.0);
            }completion:^(BOOL finished){
                [self setNeedsStatusBarAppearanceUpdate];
                [fake removeFromSuperview];
            }];
        }else{
            [self setNeedsStatusBarAppearanceUpdate];
            fake.contentMode = UIViewContentModeBottom;
            [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                fake.frame = CGRectMake(0.0, [self view].frame.size.height, [self view].frame.size.width, 0.0);
            }completion:^(BOOL finished){
                [fake removeFromSuperview];
            }];
        }
    }
}

-(void)viewWillLayoutSubviews {
    %orig;
    if ([self welcomeController]) {
        [[[self welcomeController] view] setFrame:[[self view] bounds]];
    }
    if ([self settingsController]) {
        [[[self settingsController] view] setFrame:[[self view] bounds]];
    }
}

%end

%end

%group ViewController

%hook DisplayViewController

%new
-(UILabel *)valueLabel {
    return [((DisplayView *)[self view]) valueLabel];
}

-(void)paste:(id)arg {
    %orig;
    [[sharedController model] buttonPressed:-1];
}

-(void)longPress:(UIGestureRecognizer *)gesture {
    if (CGRectContainsPoint([[[self view] valueForKey:@"copyButtonView"] frame], [gesture locationInView:[self view]])) {
        [sharedController showSettingsController];
    }else{
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Paste" message:@"Do you want to paste the value saved in your clipboard?" preferredStyle:UIAlertControllerStyleActionSheet];
        [controller addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
            [self paste:nil];
        }]];
        [controller addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}]];
        [controller addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {}]];
        
        [self presentViewController:controller animated:YES completion:nil];
    }
}

%end

%end

%group View

%hook DisplayView

%property (nonatomic, strong) CAShapeLayer *bottomSeparator;
%property (nonatomic, strong) CopyButtonView *copyButtonView;
%property (nonatomic, strong) UILabel *historyLabel;
%property (nonatomic, strong) UINotificationFeedbackGenerator *feedbackGenerator;

-(id)initWithFrame:(CGRect)frame {
    if ((self = %orig)) {
        [self setFeedbackGenerator:[[UINotificationFeedbackGenerator alloc] init]];
        
        [self setHistoryLabel:[[BadLabel alloc] initWithEdgeInsets:UIEdgeInsetsMake(20, 5, 0, 5)]];
        [[self historyLabel] setTag:333];
        [[self historyLabel] setTextColor:lineColor];
        [[self historyLabel] setLineBreakMode:NSLineBreakByTruncatingHead];
        [[self historyLabel] setTextAlignment:NSTextAlignmentRight];
        if (wantsOriginalFont) {
            [[self historyLabel] setFont:[UIFont systemFontOfSize:fontSizeOfHistoryLabel]];
        }else{
            [[self historyLabel] setFont:[UIFont fontWithName:fontName size:fontSizeOfHistoryLabel]];
        }
        
        [self addSubview:[self historyLabel]];
        
        [self setCopyButtonView:[[CopyButtonView alloc] initWithStrokeColor:lineColor backgroundColor:backColor diagonalLenghtPerc:0.58 cornerRadius:4.0 lineWidth:3.0]];
        [[self valueForKey:@"copyButtonView"] addTarget:self action:@selector(copyValue) withGestureRecognizerClass:[UITapGestureRecognizer class] withKey:@"tap"];
        [[self valueForKey:@"copyButtonView"] addTarget:self action:@selector(openSettings) withGestureRecognizerClass:[UILongPressGestureRecognizer class] withKey:@"long"];
        [self addSubview:[self copyButtonView]];
        
        [self setBottomSeparator:[CAShapeLayer layer]];
        [self bottomSeparator].fillColor = lineColor.CGColor;
        [self bottomSeparator].strokeColor = lineColor.CGColor;
        [self bottomSeparator].lineCap = kCALineCapRound;
        [self bottomSeparator].opacity = 1.0;
        [self bottomSeparator].lineWidth = 4.0;
        
        [[self layer] addSublayer:[self bottomSeparator]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:)  name:UIDeviceOrientationDidChangeNotification  object:nil];
    }
    return self;
}

%new
-(void)openSettings {
    [sharedController showSettingsController];
}

%new
-(void)copyValue {
    //[((DisplayViewController *)[self _viewControllerForAncestor]) paste:nil];
    [UIPasteboard generalPasteboard].string = ((UILabel *)[self valueLabel]).text;
    NSInteger support = [[UIDevice currentDevice] _feedbackSupportLevel];
    if (support >= 2) {
        [[self feedbackGenerator] prepare];
        [[self feedbackGenerator] notificationOccurred:UINotificationFeedbackTypeSuccess];
    }else if (support == 1) {
        AudioServicesPlaySystemSound(SystemSoundID(1519));
    }else{
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate));
    }
}

%new
-(void)orientationChanged:(NSNotification *)notifcation {
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        [[self valueForKey:@"historyLabel"] setHidden:YES];
    }else{
        [[self valueForKey:@"historyLabel"] setHidden:NO];
    }
}

-(UIColor *)backgroundColor {
    return backColor;
}

-(void)setBackgroundColor:(UIColor *)color {
    return %orig(backColor);
}

-(void)layoutSubviews {
    %orig;
    UIView *refButton = [[[[sharedController keypadController] activeKeypad] buttons] firstObject];
    CGFloat start = refButton.frame.origin.x + additive;
    CGFloat s = [self valueLabel].frame.size.height / 3.5;
    CGFloat w = [self valueLabel].frame.size.width;
    if (w >= [self frame].size.width - (start * 2 + refButton.frame.size.width)) {
        w = [self frame].size.width - (start * 2 + refButton.frame.size.width);
    }
    [self valueLabel].frame = CGRectMake([self valueLabel].frame.origin.x + ([self valueLabel].frame.size.width - w), [self valueLabel].frame.origin.y - 15, w, [self valueLabel].frame.size.height);
    if ([self modeLabel]) {
        [self modeLabel].frame = CGRectMake(start, [self modeLabel].frame.origin.y, [self modeLabel].frame.size.width, [self modeLabel].frame.size.height);
    }
    [[self valueForKey:@"copyButtonView"] setFrame:CGRectMake(start + (refButton.frame.size.width - additive * 2.0 - s) / 2.0, [self valueLabel].frame.origin.y + ([self valueLabel].frame.size.height - s) / 2.0, s, s)];
    if ([[[UIApplication sharedApplication] keyWindow] safeAreaInsets].bottom) {
        [[self valueForKey:@"historyLabel"] setEdgeInsets:UIEdgeInsetsMake(80, 5, 0, 5)];
    }
    [[self valueForKey:@"historyLabel"] setFrame:CGRectMake([[self valueForKey:@"copyButtonView"] frame].origin.x + [[self valueForKey:@"copyButtonView"] frame].size.width + 5.0, 0.0, [self valueLabel].frame.origin.x + [self valueLabel].frame.size.width - ([[self valueForKey:@"copyButtonView"] frame].origin.x + [[self valueForKey:@"copyButtonView"] frame].size.width + 5.0), [self valueLabel].frame.origin.y)];
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    CGFloat diff = -3.0;
    [linePath moveToPoint:CGPointMake(start, [self valueLabel].frame.origin.y + [self valueLabel].frame.size.height - diff)];
    [linePath addLineToPoint:CGPointMake([self frame].size.width - start, [self valueLabel].frame.origin.y + [self valueLabel].frame.size.height - diff)];
    [self bottomSeparator].path=linePath.CGPath;
}

-(void)addSubview:(UIView *)v {
    if ([v isKindOfClass:NSClassFromString(@"UILabel")] && [v tag] != 333) {
        [((UILabel *)v) setTextColor:numbersTextColor];
        if (v.frame.size.width == 0.0) {
            modeLabel = (UILabel *)v;
        }
    }
    %orig(v);
}

-(void)addGestureRecognizer:(UIGestureRecognizer *)gesture {
    if ([gesture isKindOfClass:NSClassFromString(@"UISwipeGestureRecognizer")] || [gesture isKindOfClass:NSClassFromString(@"UILongPressGestureRecognizer")]) {
        %orig;
    }
}

%new
-(UILabel *)valueLabel {
    //return [self valueForKey:@"valueLabel"];
    return [self accessibilityValueLabel];
}

%new
-(UILabel *)modeLabel {
    return modeLabel;
}

%end

%end

%group KeyPadController

%hook KeyPadViewController

%new
-(id)activeKeypad {
    return [self accessibilityActiveKeypad];
}

%new
-(id)basicKeypad {
    return MSHookIvar<id>(self, "basicKeypad");
}

%new
-(id)scientificKeypad {
    return MSHookIvar<id>(self, "scientificKeypad");
}

%end

%end

%group KeyPad

%hook KeyPadView

%new
-(id)buttons {
    return [self accessibilityCalculatorButtons];
}

%end

%end

%group Button

%hook CalculatorKeypadButton

%new
-(BOOL)isActive {
    return MSHookIvar<BOOL>(self, "_isActive");
}

%new
-(NSInteger)calculatorButtonID {
    return [self accessibilityCalculatorButtonID];
}

-(void)setFrame:(CGRect)frame {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kOldLayout]) {
        %orig;
    }else{
        frame = CGRectMake(frame.origin.x - additive, frame.origin.y - additive, frame.size.width + additive * 2.0, frame.size.height + additive * 2.0);
        NSUInteger buttonID = [self calculatorButtonID];
        CalculatorKeypadButton *refButton = [[[[sharedController keypadController] activeKeypad] buttons] firstObject];
        if (buttonID == 11) {
            bigWidth = frame.size.width;
            frame = CGRectMake(frame.origin.x, frame.origin.y, refButton.frame.size.width, frame.size.height);
            %orig(frame);
        }else if (buttonID == 9) {
            frame = CGRectMake(frame.origin.x - (bigWidth - frame.size.width), frame.origin.y, bigWidth, frame.size.height);
            %orig(frame);
        }else if (buttonID == 52 || buttonID == 10) {
            frame = CGRectMake(frame.origin.x - (bigWidth - frame.size.width), frame.origin.y, frame.size.width, frame.size.height);
            %orig(frame);
        }else{
            %orig;
        }
    }
}

-(void)layoutSubviews {
    %orig;
    [[self label] setFrame:CGRectMake(additive, additive, [self frame].size.width - additive * 2.0, [self frame].size.height - additive * 2.0)];
}

-(UIColor *)backgroundColor {
    return [UIColor clearColor];
}

-(void)setBackgroundColor:(UIColor *)color {
    return %orig([UIColor clearColor]);
}

- (void)drawRect:(CGRect)rect {
    rect = CGRectMake(rect.origin.x + additive, rect.origin.y + additive, rect.size.width - additive * 2.0, rect.size.height - additive * 2.0);
    NSUInteger buttonID = [self calculatorButtonID];
    [backColor setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.height / 2.0];
    
    CGContextSaveGState(context);
    
    if ((buttonID >= 11 && buttonID <= 20) || buttonID == 52 || buttonID == 10) {
        [colorFromString(kBasicKeypad, backColor) setFill];
        [[self label] setTextColor:numbersTextColor];
    }else if (buttonID >= 3 && buttonID <= 8) {
        if ([self isActive]) {
            [colorFromString(kActiveOperators, [UIColor yellowColor]) setFill];
        }else{
            [colorFromString(kOperators, [UIColor whiteColor]) setFill];
        }
        [[self label] setTextColor:numbersTextColorWhite];
        CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 6, [numbersTextColor colorWithAlphaComponent:alphaChannelForOperators].CGColor);
    }else if (buttonID == 51 || buttonID == 1) {
        [colorFromString(kCancel, cancelColor) setFill];
        [[self label] setTextColor:[UIColor whiteColor]];
        CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 6, [colorFromString(kCancel, cancelColor) colorWithAlphaComponent:alphaChannelForOthers].CGColor);
    }else if (buttonID == 9) {
        [colorFromString(kResult, resultColor) setFill];
        [[self label] setTextColor:[UIColor whiteColor]];
        CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 6, [colorFromString(kResult, resultColor) colorWithAlphaComponent:alphaChannelForOthers].CGColor);
    }else{
        [colorFromString(kScientificKeypad, numbersTextColorWhite) setFill];
        CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 6, [numbersTextColor colorWithAlphaComponent:alphaChannelForOthers].CGColor);
    }
    [rectanglePath fill];
    
    CGContextRestoreGState(context);
}

%new
-(UILabel *)label {
    if ([[self subviews][0] isKindOfClass:[UILabel class]]) {
        return [self subviews][0];
    }else{
        return [self subviews][1];
    }
}

-(BOOL)isOpaque {
    return NO;
}

-(void)setOpaque:(BOOL)opaque {
    %orig(NO);
}

%end

%end

%group Highlight

%hook HighlightView

- (void)drawRect:(CGRect)rect {
    if (!highlightViews) {
        highlightViews = [[NSMutableArray alloc] init];
    }
    if (![highlightViews containsObject:self]) {
        [highlightViews addObject:self];
    }
    [backColor setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
    rect = CGRectMake(rect.origin.x + additive, rect.origin.y + additive, rect.size.width - additive * 2.0, rect.size.height - additive * 2.0);
    //NSInteger buttonID = [self calculatorButtonID];
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.height / 2.0];
    /*if ((buttonID >= 11 && buttonID <= 20) || buttonID == 52) {
        [[UIColor brownColor] setFill];
    }else if (buttonID >= 3 && buttonID <= 8) {
        [[UIColor yellowColor] setFill];
    }else if (buttonID == 51 || buttonID == -1 || buttonID == 1) {
        [cancelColor setFill];
    }else if (buttonID == 9) {
        [resultColor setFill];
    }else{
        [[UIColor purpleColor] setFill];
    }*/
    [((UIColor *)[self fillColor]) setFill];
    [rectanglePath fill];
}

%new
-(UIColor *)fillColor {
    return [UIColor colorWithWhite:0.5 alpha:1.0];//MSHookIvar<UIColor *>(self, "fillColor");
}

/*
-(UIColor *)fillColor {
    NSInteger buttonID = [self calculatorButtonID];
    if ((buttonID >= 11 && buttonID <= 20) || buttonID == 52) {
        return [UIColor brownColor];
    }else if (buttonID >= 3 && buttonID <= 8) {
        return [UIColor yellowColor];
    }else if (buttonID == 51 || buttonID == -1 || buttonID == 1) {
        return cancelColor;
    }else if (buttonID == 9) {
        return resultColor;
    }else{
        return [UIColor brownColor];
    }
}
*/
/*
-(CGRect)frame {
    CGRect original = %orig;
    return CGRectMake(additive, additive, original.size.width - additive * 2.0, original.size.height - additive * 2.0);
}

-(void)setFrame:(CGRect)frame {
    %orig(CGRectMake(additive, additive, frame.size.width - additive * 2.0, frame.size.height - additive * 2.0));
}
*/
-(BOOL)isOpaque {
    return NO;
}

-(void)setOpaque:(BOOL)opaque {
    %orig(NO);
}

%new
-(NSInteger)calculatorButtonID {
    if (![self superview]) {
        return -1;
    }
    return [((CalculatorKeypadButton *)[self superview]) calculatorButtonID];
}

-(void)dealloc {
    [highlightViews removeObject:self];
    %orig;
}

%end

%end

%group StaticFont

%hook UILabel

-(UIFont *)font {
    UIFont *original = %orig;
    return [UIFont fontWithName:fontName size:original.pointSize];
}

-(void)setFont:(UIFont *)font {
    %orig([UIFont fontWithName:fontName size:font.pointSize]);
}

-(id)_defaultAttributes {
    NSMutableDictionary *dict = %orig;
    if (![dict respondsToSelector:@selector(setObject:forKey:)]) {
        dict = [dict mutableCopy];
    }
    UIFont *oldFont = [dict objectForKey:@"NSFont"];
    [dict setObject:[UIFont fontWithName:fontName size:oldFont.pointSize] forKey:@"NSFont"];
    return dict;
}

-(void)_setDefaultAttributes:(NSMutableDictionary *)dict {
    if (![dict respondsToSelector:@selector(setObject:forKey:)]) {
        dict = [dict mutableCopy];
    }
    UIFont *oldFont = [dict objectForKey:@"NSFont"];
    [dict setObject:[UIFont fontWithName:fontName size:oldFont.pointSize] forKey:@"NSFont"];
    %orig(dict);
}

-(NSMutableAttributedString *)attributedText {
    NSMutableAttributedString *str = %orig;
    if (![str respondsToSelector:@selector(setAttributes:range:)]) {
        str = [str mutableCopy];
    }
    NSMutableDictionary *dict = [[str attributesAtIndex:0 longestEffectiveRange:NULL inRange:NSMakeRange(0, str.length)] mutableCopy];
    [dict setObject:[UIFont fontWithName:fontName size:((UIFont *)[dict objectForKey:NSFontAttributeName]).pointSize] forKey:NSFontAttributeName];
    if ([dict objectForKey:NSBaselineOffsetAttributeName]) {
        [dict setObject:textOffset(str, [dict objectForKey:NSBaselineOffsetAttributeName]) forKey:NSBaselineOffsetAttributeName];
    }
    [str setAttributes:dict range:NSMakeRange(0, str.length)];
    return str;
}

-(void)setAttributedText:(NSMutableAttributedString *)str {
    if (![str respondsToSelector:@selector(setAttributes:range:)]) {
        str = [str mutableCopy];
    }
    NSMutableDictionary *dict = [[str attributesAtIndex:0 longestEffectiveRange:NULL inRange:NSMakeRange(0, str.length)] mutableCopy];
    [dict setObject:[UIFont fontWithName:fontName size:((UIFont *)[dict objectForKey:NSFontAttributeName]).pointSize] forKey:NSFontAttributeName];
    if ([dict objectForKey:NSBaselineOffsetAttributeName]) {
        [dict setObject:textOffset(str, [dict objectForKey:NSBaselineOffsetAttributeName]) forKey:NSBaselineOffsetAttributeName];
    }
    [str setAttributes:dict range:NSMakeRange(0, str.length)];
    %orig(str);
}

%end

%end

%group StaticColor

%hook UILabel

-(void)setTextColor:(UIColor *)color {
    if ([self tag] != 333) {
        if ([[[self superview] superview] isKindOfClass:NSClassFromString(@"Calculator.CalculatorKeypadView")]) {
            CalculatorKeypadButton *button = (CalculatorKeypadButton *)[self superview];
            if ([button isKindOfClass:NSClassFromString(@"Calculator.CalculatorKeypadButton")]) {
                UIColor *cl = [UIColor blackColor];
                NSUInteger buttonID = [button calculatorButtonID]; //Non va forse non viene chiamato o guarda altro
                if ((buttonID >= 11 && buttonID <= 20) || buttonID == 52 || buttonID == 10) {
                    cl = colorFromString(kBasicKeypad, backColor);
                }else if (buttonID >= 3 && buttonID <= 8) {
                    if ([button isActive]) {
                        cl = colorFromString(kActiveOperators, [UIColor yellowColor]);
                    }else{
                        cl = colorFromString(kOperators, [UIColor whiteColor]);
                    }
                }else if (buttonID == 51 || buttonID == 1) {
                    cl = colorFromString(kCancel, cancelColor);
                }else if (buttonID == 9) {
                    cl = colorFromString(kResult, resultColor);
                }else{
                    cl = colorFromString(kScientificKeypad, numbersTextColorWhite);
                }
                if (color == [UIColor blackColor]) {
                    %orig(colorFromString(kCancel, cancelColor));
                }else{
                    CGFloat r = 0.0;
                    CGFloat g = 0.0;
                    CGFloat b = 0.0;
                    [cl getRed:&r green:&g blue:&b alpha:NULL];
                    if (r * 255 * 0.299 + g * 255 * 0.587 + b * 255 * 0.114 > 186) {
                        %orig([UIColor blackColor]);
                    }else{
                        %orig([UIColor whiteColor]);
                    }
                }
            }else{
                if (color == [UIColor blackColor]) {
                    %orig(colorFromString(kCancel, cancelColor));
                }else{
                    %orig;
                }
            }
        }else if ([[self superview] isKindOfClass:NSClassFromString(@"Calculator.DisplayView")]) {
            %orig(numbersTextColor);
        }else{
            %orig;
        }
    }else{
        %orig;
    }
}

%end

%end

%ctor {
    NSString *bundleIdentifier = [NSBundle mainBundle].bundleIdentifier;
    if ([bundleIdentifier isEqualToString:@"com.apple.calculator"]) {
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        if (![def boolForKey:kWelcome]) {
            [def setBool:NO forKey:kDarkMode];
            [def setBool:NO forKey:kOldLayout];
            [def setObject:@"cool" forKey:kAnimation];
            [def setObject:@"default" forKey:kCancel];
            [def setObject:@"default" forKey:kResult];
            [def setObject:@"default" forKey:kBasicKeypad];
            [def setObject:@"default" forKey:kScientificKeypad];
            [def setObject:@"default" forKey:kOperators];
            [def setObject:@"default" forKey:kActiveOperators];
            [def synchronize];
        }
        %init(App, Delegate=objc_getClass("Calculator.AppDelegate"));
        %init(Model, CalculatorModel=objc_getClass("Calculator.CalculatorModel"));
        %init(Value, DisplayValue=objc_getClass("Calculator.DisplayValue"));
        %init(Window, CalculatorWindow=objc_getClass("Calculator.CalculatorWindow"));
        %init(RootViewController, CalculatorController=objc_getClass("Calculator.CalculatorController"));
        %init(ViewController, DisplayViewController=objc_getClass("Calculator.DisplayViewController"));
        %init(View, DisplayView=objc_getClass("Calculator.DisplayView"));
        %init(KeyPadController, KeyPadViewController=objc_getClass("Calculator.KeypadViewController"));
        %init(KeyPad, KeyPadView=objc_getClass("Calculator.CalculatorKeypadView"));
        %init(Button, CalculatorKeypadButton=objc_getClass("Calculator.CalculatorKeypadButton"));
        %init(Highlight, HighlightView=objc_getClass("_TtCC10Calculator22CalculatorKeypadButton13HighlightView"));
        if (!wantsOriginalFont) {
            %init(StaticFont);
        }
        %init(StaticColor);
    }
}
