#line 1 "/Users/gabrielefilipponi/Desktop/Progetti/MathTeacher/MathTeacher/MathTeacher.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class HighlightView; @class KeyPadView; @class CalculatorWindow; @class DisplayView; @class KeyPadViewController; @class DisplayViewController; @class CalculatorController; @class UILabel; @class CalculatorModel; @class Delegate; @class CalculatorKeypadButton; @class DisplayValue; 


#line 36 "/Users/gabrielefilipponi/Desktop/Progetti/MathTeacher/MathTeacher/MathTeacher.xm"
static BOOL (*_logos_orig$App$Delegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary<UIApplicationLaunchOptionsKey, id> *); static BOOL _logos_method$App$Delegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary<UIApplicationLaunchOptionsKey, id> *); 



static BOOL _logos_method$App$Delegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary<UIApplicationLaunchOptionsKey, id> * launchOptions) {
    return _logos_orig$App$Delegate$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);
}





static id _logos_method$Model$CalculatorModel$displayValue(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$Model$CalculatorModel$delegate(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$Model$CalculatorModel$addObject$toArray$atIndex$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id, NSMutableArray *, NSUInteger); static NSString * _logos_method$Model$CalculatorModel$operatorStringFromButtonID$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, NSInteger); static NSString * _logos_method$Model$CalculatorModel$functionStringFromButtonID$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, NSInteger); static void (*_logos_orig$Model$CalculatorModel$buttonPressed$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, NSInteger); static void _logos_method$Model$CalculatorModel$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, NSInteger); 



__attribute__((used)) static NSString * _logos_method$Model$CalculatorModel$lastNumber(CalculatorModel * __unused self, SEL __unused _cmd) { return (NSString *)objc_getAssociatedObject(self, (void *)_logos_method$Model$CalculatorModel$lastNumber); }; __attribute__((used)) static void _logos_method$Model$CalculatorModel$setLastNumber(CalculatorModel * __unused self, SEL __unused _cmd, NSString * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Model$CalculatorModel$lastNumber, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSString * _logos_method$Model$CalculatorModel$lastOperator(CalculatorModel * __unused self, SEL __unused _cmd) { return (NSString *)objc_getAssociatedObject(self, (void *)_logos_method$Model$CalculatorModel$lastOperator); }; __attribute__((used)) static void _logos_method$Model$CalculatorModel$setLastOperator(CalculatorModel * __unused self, SEL __unused _cmd, NSString * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Model$CalculatorModel$lastOperator, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static Stack * _logos_method$Model$CalculatorModel$stack(CalculatorModel * __unused self, SEL __unused _cmd) { return (Stack *)objc_getAssociatedObject(self, (void *)_logos_method$Model$CalculatorModel$stack); }; __attribute__((used)) static void _logos_method$Model$CalculatorModel$setStack(CalculatorModel * __unused self, SEL __unused _cmd, Stack * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Model$CalculatorModel$stack, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }


static id _logos_method$Model$CalculatorModel$displayValue(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityDisplayValue];
}


static id _logos_method$Model$CalculatorModel$delegate(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return MSHookIvar<id>(self, "delegate");
}


static void _logos_method$Model$CalculatorModel$addObject$toArray$atIndex$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id objc, NSMutableArray * array, NSUInteger index) {
    if ([array count] == index) {
        [array addObject:objc];
    }else{
        array[index] = objc;
    }
}


static NSString * _logos_method$Model$CalculatorModel$operatorStringFromButtonID$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSInteger button) {
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


static NSString * _logos_method$Model$CalculatorModel$functionStringFromButtonID$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSInteger button) {
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

static void _logos_method$Model$CalculatorModel$buttonPressed$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSInteger button) {
    _logos_orig$Model$CalculatorModel$buttonPressed$(self, _cmd, button);
    NSString *value = [[self displayValue] value];
    if (button == 1) {
        [[self stack] addOrModifyValue:@"0" withButtonType:buttonTypeNumber]; 
    }else if (button == 51) {
        [[self stack] clearStack];
    }else if (button == 3) {
        [[self stack] addOrModifyValue:value withButtonType:buttonTypeNumber];
    }else if (button == 4) {
        [[self stack] addOrModifyValue:@"" withButtonType:buttonTypePercentage];
    }else if (button >= 5 && button <= 8) {
        [[self stack] addOrModifyValue:[self operatorStringFromButtonID:button] withButtonType:buttonTypeOperator];
    }else if (button == 9) {
        
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





static NSString * _logos_method$Value$DisplayValue$value(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 




static NSString * _logos_method$Value$DisplayValue$value(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityStringValue];
}





static UIColor * (*_logos_orig$Window$CalculatorWindow$backgroundColor)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UIColor * _logos_method$Window$CalculatorWindow$backgroundColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Window$CalculatorWindow$setBackgroundColor$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$Window$CalculatorWindow$setBackgroundColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIColor *); 



static UIColor * _logos_method$Window$CalculatorWindow$backgroundColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return backColor;
}

static void _logos_method$Window$CalculatorWindow$setBackgroundColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
    _logos_orig$Window$CalculatorWindow$setBackgroundColor$(self, _cmd, backColor);
}





static id (*_logos_orig$RootViewController$CalculatorController$initWithNibName$bundle$)(_LOGOS_SELF_TYPE_INIT id, SEL, id, id) _LOGOS_RETURN_RETAINED; static id _logos_method$RootViewController$CalculatorController$initWithNibName$bundle$(_LOGOS_SELF_TYPE_INIT id, SEL, id, id) _LOGOS_RETURN_RETAINED; static UIStatusBarStyle (*_logos_orig$RootViewController$CalculatorController$preferredStatusBarStyle)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UIStatusBarStyle _logos_method$RootViewController$CalculatorController$preferredStatusBarStyle(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$RootViewController$CalculatorController$prefersStatusBarHidden)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$RootViewController$CalculatorController$prefersStatusBarHidden(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$RootViewController$CalculatorController$model(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$RootViewController$CalculatorController$displayController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$RootViewController$CalculatorController$keypadController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$RootViewController$CalculatorController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$RootViewController$CalculatorController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$RootViewController$CalculatorController$viewDidAppear$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RootViewController$CalculatorController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$RootViewController$CalculatorController$showSettingsController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$RootViewController$CalculatorController$dismissWelcomeController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$RootViewController$CalculatorController$dismissSettingsController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$RootViewController$CalculatorController$updateUI(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$RootViewController$CalculatorController$toggleColorMode$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UISwipeGestureRecognizer *); static void (*_logos_orig$RootViewController$CalculatorController$viewWillLayoutSubviews)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$RootViewController$CalculatorController$viewWillLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 



__attribute__((used)) static WelcomeViewController * _logos_method$RootViewController$CalculatorController$welcomeController(CalculatorController * __unused self, SEL __unused _cmd) { return (WelcomeViewController *)objc_getAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$welcomeController); }; __attribute__((used)) static void _logos_method$RootViewController$CalculatorController$setWelcomeController(CalculatorController * __unused self, SEL __unused _cmd, WelcomeViewController * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$welcomeController, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImageView * _logos_method$RootViewController$CalculatorController$fakeImageView(CalculatorController * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$fakeImageView); }; __attribute__((used)) static void _logos_method$RootViewController$CalculatorController$setFakeImageView(CalculatorController * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$fakeImageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImpactFeedbackGenerator * _logos_method$RootViewController$CalculatorController$feedbackGenerator(CalculatorController * __unused self, SEL __unused _cmd) { return (UIImpactFeedbackGenerator *)objc_getAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$feedbackGenerator); }; __attribute__((used)) static void _logos_method$RootViewController$CalculatorController$setFeedbackGenerator(CalculatorController * __unused self, SEL __unused _cmd, UIImpactFeedbackGenerator * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$feedbackGenerator, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UINavigationController * _logos_method$RootViewController$CalculatorController$settingsController(CalculatorController * __unused self, SEL __unused _cmd) { return (UINavigationController *)objc_getAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$settingsController); }; __attribute__((used)) static void _logos_method$RootViewController$CalculatorController$setSettingsController(CalculatorController * __unused self, SEL __unused _cmd, UINavigationController * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$RootViewController$CalculatorController$settingsController, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static id _logos_method$RootViewController$CalculatorController$initWithNibName$bundle$(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd, id name, id bundle) _LOGOS_RETURN_RETAINED {
    sharedController = _logos_orig$RootViewController$CalculatorController$initWithNibName$bundle$(self, _cmd, name, bundle);
    [sharedController setFeedbackGenerator:[[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight]];
    return sharedController;
}

static UIStatusBarStyle _logos_method$RootViewController$CalculatorController$preferredStatusBarStyle(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kDarkMode] && ![self settingsController]) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

static BOOL _logos_method$RootViewController$CalculatorController$prefersStatusBarHidden(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return YES;
}


static id _logos_method$RootViewController$CalculatorController$model(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return MSHookIvar<id>(self, "model");
}


static id _logos_method$RootViewController$CalculatorController$displayController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityDisplayController];
}


static id _logos_method$RootViewController$CalculatorController$keypadController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityKeypadController];
}

static void _logos_method$RootViewController$CalculatorController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$RootViewController$CalculatorController$viewDidLoad(self, _cmd);
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

static void _logos_method$RootViewController$CalculatorController$viewDidAppear$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL animated) {
    _logos_orig$RootViewController$CalculatorController$viewDidAppear$(self, _cmd, animated);
    
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


static void _logos_method$RootViewController$CalculatorController$showSettingsController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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


static void _logos_method$RootViewController$CalculatorController$dismissWelcomeController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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


static void _logos_method$RootViewController$CalculatorController$dismissSettingsController(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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


static void _logos_method$RootViewController$CalculatorController$updateUI(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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


static void _logos_method$RootViewController$CalculatorController$toggleColorMode$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UISwipeGestureRecognizer * gesture) {
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

static void _logos_method$RootViewController$CalculatorController$viewWillLayoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$RootViewController$CalculatorController$viewWillLayoutSubviews(self, _cmd);
    if ([self welcomeController]) {
        [[[self welcomeController] view] setFrame:[[self view] bounds]];
    }
    if ([self settingsController]) {
        [[[self settingsController] view] setFrame:[[self view] bounds]];
    }
}





static UILabel * _logos_method$ViewController$DisplayViewController$valueLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$ViewController$DisplayViewController$paste$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void _logos_method$ViewController$DisplayViewController$paste$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$ViewController$DisplayViewController$longPress$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIGestureRecognizer *); static void _logos_method$ViewController$DisplayViewController$longPress$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIGestureRecognizer *); 




static UILabel * _logos_method$ViewController$DisplayViewController$valueLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [((DisplayView *)[self view]) valueLabel];
}

static void _logos_method$ViewController$DisplayViewController$paste$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg) {
    _logos_orig$ViewController$DisplayViewController$paste$(self, _cmd, arg);
    [[sharedController model] buttonPressed:-1];
}

static void _logos_method$ViewController$DisplayViewController$longPress$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIGestureRecognizer * gesture) {
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





static id (*_logos_orig$View$DisplayView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT id, SEL, CGRect) _LOGOS_RETURN_RETAINED; static id _logos_method$View$DisplayView$initWithFrame$(_LOGOS_SELF_TYPE_INIT id, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$View$DisplayView$openSettings(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$View$DisplayView$copyValue(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$View$DisplayView$orientationChanged$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, NSNotification *); static UIColor * (*_logos_orig$View$DisplayView$backgroundColor)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UIColor * _logos_method$View$DisplayView$backgroundColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$View$DisplayView$setBackgroundColor$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$View$DisplayView$setBackgroundColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$View$DisplayView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$View$DisplayView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$View$DisplayView$addSubview$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIView *); static void _logos_method$View$DisplayView$addSubview$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIView *); static void (*_logos_orig$View$DisplayView$addGestureRecognizer$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIGestureRecognizer *); static void _logos_method$View$DisplayView$addGestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIGestureRecognizer *); static UILabel * _logos_method$View$DisplayView$valueLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UILabel * _logos_method$View$DisplayView$modeLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 



__attribute__((used)) static CAShapeLayer * _logos_method$View$DisplayView$bottomSeparator(DisplayView * __unused self, SEL __unused _cmd) { return (CAShapeLayer *)objc_getAssociatedObject(self, (void *)_logos_method$View$DisplayView$bottomSeparator); }; __attribute__((used)) static void _logos_method$View$DisplayView$setBottomSeparator(DisplayView * __unused self, SEL __unused _cmd, CAShapeLayer * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$View$DisplayView$bottomSeparator, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static CopyButtonView * _logos_method$View$DisplayView$copyButtonView(DisplayView * __unused self, SEL __unused _cmd) { return (CopyButtonView *)objc_getAssociatedObject(self, (void *)_logos_method$View$DisplayView$copyButtonView); }; __attribute__((used)) static void _logos_method$View$DisplayView$setCopyButtonView(DisplayView * __unused self, SEL __unused _cmd, CopyButtonView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$View$DisplayView$copyButtonView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$View$DisplayView$historyLabel(DisplayView * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$View$DisplayView$historyLabel); }; __attribute__((used)) static void _logos_method$View$DisplayView$setHistoryLabel(DisplayView * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$View$DisplayView$historyLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UINotificationFeedbackGenerator * _logos_method$View$DisplayView$feedbackGenerator(DisplayView * __unused self, SEL __unused _cmd) { return (UINotificationFeedbackGenerator *)objc_getAssociatedObject(self, (void *)_logos_method$View$DisplayView$feedbackGenerator); }; __attribute__((used)) static void _logos_method$View$DisplayView$setFeedbackGenerator(DisplayView * __unused self, SEL __unused _cmd, UINotificationFeedbackGenerator * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$View$DisplayView$feedbackGenerator, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static id _logos_method$View$DisplayView$initWithFrame$(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
    if ((self = _logos_orig$View$DisplayView$initWithFrame$(self, _cmd, frame))) {
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


static void _logos_method$View$DisplayView$openSettings(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [sharedController showSettingsController];
}


static void _logos_method$View$DisplayView$copyValue(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
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


static void _logos_method$View$DisplayView$orientationChanged$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notifcation) {
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        [[self valueForKey:@"historyLabel"] setHidden:YES];
    }else{
        [[self valueForKey:@"historyLabel"] setHidden:NO];
    }
}

static UIColor * _logos_method$View$DisplayView$backgroundColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return backColor;
}

static void _logos_method$View$DisplayView$setBackgroundColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
    return _logos_orig$View$DisplayView$setBackgroundColor$(self, _cmd, backColor);
}

static void _logos_method$View$DisplayView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$View$DisplayView$layoutSubviews(self, _cmd);
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

static void _logos_method$View$DisplayView$addSubview$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIView * v) {
    if ([v isKindOfClass:NSClassFromString(@"UILabel")] && [v tag] != 333) {
        [((UILabel *)v) setTextColor:numbersTextColor];
        if (v.frame.size.width == 0.0) {
            modeLabel = (UILabel *)v;
        }
    }
    _logos_orig$View$DisplayView$addSubview$(self, _cmd, v);
}

static void _logos_method$View$DisplayView$addGestureRecognizer$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIGestureRecognizer * gesture) {
    if ([gesture isKindOfClass:NSClassFromString(@"UISwipeGestureRecognizer")] || [gesture isKindOfClass:NSClassFromString(@"UILongPressGestureRecognizer")]) {
        _logos_orig$View$DisplayView$addGestureRecognizer$(self, _cmd, gesture);
    }
}


static UILabel * _logos_method$View$DisplayView$valueLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    return [self accessibilityValueLabel];
}


static UILabel * _logos_method$View$DisplayView$modeLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return modeLabel;
}





static id _logos_method$KeyPadController$KeyPadViewController$activeKeypad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$KeyPadController$KeyPadViewController$basicKeypad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$KeyPadController$KeyPadViewController$scientificKeypad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 




static id _logos_method$KeyPadController$KeyPadViewController$activeKeypad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityActiveKeypad];
}


static id _logos_method$KeyPadController$KeyPadViewController$basicKeypad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return MSHookIvar<id>(self, "basicKeypad");
}


static id _logos_method$KeyPadController$KeyPadViewController$scientificKeypad(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return MSHookIvar<id>(self, "scientificKeypad");
}





static id _logos_method$KeyPad$KeyPadView$buttons(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 




static id _logos_method$KeyPad$KeyPadView$buttons(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityCalculatorButtons];
}





static BOOL _logos_method$Button$CalculatorKeypadButton$isActive(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static NSInteger _logos_method$Button$CalculatorKeypadButton$calculatorButtonID(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Button$CalculatorKeypadButton$setFrame$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$Button$CalculatorKeypadButton$setFrame$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, CGRect); static void (*_logos_orig$Button$CalculatorKeypadButton$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$Button$CalculatorKeypadButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UIColor * (*_logos_orig$Button$CalculatorKeypadButton$backgroundColor)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static UIColor * _logos_method$Button$CalculatorKeypadButton$backgroundColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Button$CalculatorKeypadButton$setBackgroundColor$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$Button$CalculatorKeypadButton$setBackgroundColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, UIColor *); static void (*_logos_orig$Button$CalculatorKeypadButton$drawRect$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$Button$CalculatorKeypadButton$drawRect$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, CGRect); static UILabel * _logos_method$Button$CalculatorKeypadButton$label(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Button$CalculatorKeypadButton$isOpaque)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Button$CalculatorKeypadButton$isOpaque(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Button$CalculatorKeypadButton$setOpaque$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Button$CalculatorKeypadButton$setOpaque$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); 




static BOOL _logos_method$Button$CalculatorKeypadButton$isActive(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return MSHookIvar<BOOL>(self, "_isActive");
}


static NSInteger _logos_method$Button$CalculatorKeypadButton$calculatorButtonID(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [self accessibilityCalculatorButtonID];
}

static void _logos_method$Button$CalculatorKeypadButton$setFrame$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect frame) {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kOldLayout]) {
        _logos_orig$Button$CalculatorKeypadButton$setFrame$(self, _cmd, frame);
    }else{
        frame = CGRectMake(frame.origin.x - additive, frame.origin.y - additive, frame.size.width + additive * 2.0, frame.size.height + additive * 2.0);
        NSUInteger buttonID = [self calculatorButtonID];
        CalculatorKeypadButton *refButton = [[[[sharedController keypadController] activeKeypad] buttons] firstObject];
        if (buttonID == 11) {
            bigWidth = frame.size.width;
            frame = CGRectMake(frame.origin.x, frame.origin.y, refButton.frame.size.width, frame.size.height);
            _logos_orig$Button$CalculatorKeypadButton$setFrame$(self, _cmd, frame);
        }else if (buttonID == 9) {
            frame = CGRectMake(frame.origin.x - (bigWidth - frame.size.width), frame.origin.y, bigWidth, frame.size.height);
            _logos_orig$Button$CalculatorKeypadButton$setFrame$(self, _cmd, frame);
        }else if (buttonID == 52 || buttonID == 10) {
            frame = CGRectMake(frame.origin.x - (bigWidth - frame.size.width), frame.origin.y, frame.size.width, frame.size.height);
            _logos_orig$Button$CalculatorKeypadButton$setFrame$(self, _cmd, frame);
        }else{
            _logos_orig$Button$CalculatorKeypadButton$setFrame$(self, _cmd, frame);
        }
    }
}

static void _logos_method$Button$CalculatorKeypadButton$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$Button$CalculatorKeypadButton$layoutSubviews(self, _cmd);
    [[self label] setFrame:CGRectMake(additive, additive, [self frame].size.width - additive * 2.0, [self frame].size.height - additive * 2.0)];
}

static UIColor * _logos_method$Button$CalculatorKeypadButton$backgroundColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [UIColor clearColor];
}

static void _logos_method$Button$CalculatorKeypadButton$setBackgroundColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
    return _logos_orig$Button$CalculatorKeypadButton$setBackgroundColor$(self, _cmd, [UIColor clearColor]);
}

static void _logos_method$Button$CalculatorKeypadButton$drawRect$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect rect) {
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


static UILabel * _logos_method$Button$CalculatorKeypadButton$label(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if ([[self subviews][0] isKindOfClass:[UILabel class]]) {
        return [self subviews][0];
    }else{
        return [self subviews][1];
    }
}

static BOOL _logos_method$Button$CalculatorKeypadButton$isOpaque(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}

static void _logos_method$Button$CalculatorKeypadButton$setOpaque$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL opaque) {
    _logos_orig$Button$CalculatorKeypadButton$setOpaque$(self, _cmd, NO);
}





static void (*_logos_orig$Highlight$HighlightView$drawRect$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, CGRect); static void _logos_method$Highlight$HighlightView$drawRect$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, CGRect); static UIColor * _logos_method$Highlight$HighlightView$fillColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$Highlight$HighlightView$isOpaque)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$Highlight$HighlightView$isOpaque(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Highlight$HighlightView$setOpaque$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$Highlight$HighlightView$setOpaque$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static NSInteger _logos_method$Highlight$HighlightView$calculatorButtonID(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Highlight$HighlightView$dealloc)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$Highlight$HighlightView$dealloc(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 



static void _logos_method$Highlight$HighlightView$drawRect$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, CGRect rect) {
    if (!highlightViews) {
        highlightViews = [[NSMutableArray alloc] init];
    }
    if (![highlightViews containsObject:self]) {
        [highlightViews addObject:self];
    }
    [backColor setFill];
    CGContextFillRect(UIGraphicsGetCurrentContext(), rect);
    rect = CGRectMake(rect.origin.x + additive, rect.origin.y + additive, rect.size.width - additive * 2.0, rect.size.height - additive * 2.0);
    
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.height / 2.0];
    










    [((UIColor *)[self fillColor]) setFill];
    [rectanglePath fill];
}


static UIColor * _logos_method$Highlight$HighlightView$fillColor(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return [UIColor colorWithWhite:0.5 alpha:1.0];
}



























static BOOL _logos_method$Highlight$HighlightView$isOpaque(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    return NO;
}

static void _logos_method$Highlight$HighlightView$setOpaque$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL opaque) {
    _logos_orig$Highlight$HighlightView$setOpaque$(self, _cmd, NO);
}


static NSInteger _logos_method$Highlight$HighlightView$calculatorButtonID(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (![self superview]) {
        return -1;
    }
    return [((CalculatorKeypadButton *)[self superview]) calculatorButtonID];
}

static void _logos_method$Highlight$HighlightView$dealloc(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [highlightViews removeObject:self];
    _logos_orig$Highlight$HighlightView$dealloc(self, _cmd);
}





static UIFont * (*_logos_orig$StaticFont$UILabel$font)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static UIFont * _logos_method$StaticFont$UILabel$font(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$StaticFont$UILabel$setFont$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, UIFont *); static void _logos_method$StaticFont$UILabel$setFont$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, UIFont *); static id (*_logos_orig$StaticFont$UILabel$_defaultAttributes)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static id _logos_method$StaticFont$UILabel$_defaultAttributes(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$StaticFont$UILabel$_setDefaultAttributes$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, NSMutableDictionary *); static void _logos_method$StaticFont$UILabel$_setDefaultAttributes$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, NSMutableDictionary *); static NSMutableAttributedString * (*_logos_orig$StaticFont$UILabel$attributedText)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static NSMutableAttributedString * _logos_method$StaticFont$UILabel$attributedText(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$StaticFont$UILabel$setAttributedText$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, NSMutableAttributedString *); static void _logos_method$StaticFont$UILabel$setAttributedText$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, NSMutableAttributedString *); 



static UIFont * _logos_method$StaticFont$UILabel$font(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    UIFont *original = _logos_orig$StaticFont$UILabel$font(self, _cmd);
    return [UIFont fontWithName:fontName size:original.pointSize];
}

static void _logos_method$StaticFont$UILabel$setFont$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIFont * font) {
    _logos_orig$StaticFont$UILabel$setFont$(self, _cmd, [UIFont fontWithName:fontName size:font.pointSize]);
}

static id _logos_method$StaticFont$UILabel$_defaultAttributes(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSMutableDictionary *dict = _logos_orig$StaticFont$UILabel$_defaultAttributes(self, _cmd);
    if (![dict respondsToSelector:@selector(setObject:forKey:)]) {
        dict = [dict mutableCopy];
    }
    UIFont *oldFont = [dict objectForKey:@"NSFont"];
    [dict setObject:[UIFont fontWithName:fontName size:oldFont.pointSize] forKey:@"NSFont"];
    return dict;
}

static void _logos_method$StaticFont$UILabel$_setDefaultAttributes$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSMutableDictionary * dict) {
    if (![dict respondsToSelector:@selector(setObject:forKey:)]) {
        dict = [dict mutableCopy];
    }
    UIFont *oldFont = [dict objectForKey:@"NSFont"];
    [dict setObject:[UIFont fontWithName:fontName size:oldFont.pointSize] forKey:@"NSFont"];
    _logos_orig$StaticFont$UILabel$_setDefaultAttributes$(self, _cmd, dict);
}

static NSMutableAttributedString * _logos_method$StaticFont$UILabel$attributedText(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSMutableAttributedString *str = _logos_orig$StaticFont$UILabel$attributedText(self, _cmd);
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

static void _logos_method$StaticFont$UILabel$setAttributedText$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSMutableAttributedString * str) {
    if (![str respondsToSelector:@selector(setAttributes:range:)]) {
        str = [str mutableCopy];
    }
    NSMutableDictionary *dict = [[str attributesAtIndex:0 longestEffectiveRange:NULL inRange:NSMakeRange(0, str.length)] mutableCopy];
    [dict setObject:[UIFont fontWithName:fontName size:((UIFont *)[dict objectForKey:NSFontAttributeName]).pointSize] forKey:NSFontAttributeName];
    if ([dict objectForKey:NSBaselineOffsetAttributeName]) {
        [dict setObject:textOffset(str, [dict objectForKey:NSBaselineOffsetAttributeName]) forKey:NSBaselineOffsetAttributeName];
    }
    [str setAttributes:dict range:NSMakeRange(0, str.length)];
    _logos_orig$StaticFont$UILabel$setAttributedText$(self, _cmd, str);
}





static void (*_logos_orig$StaticColor$UILabel$setTextColor$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, UIColor *); static void _logos_method$StaticColor$UILabel$setTextColor$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, UIColor *); 



static void _logos_method$StaticColor$UILabel$setTextColor$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIColor * color) {
    if ([self tag] != 333) {
        if ([[[self superview] superview] isKindOfClass:NSClassFromString(@"Calculator.CalculatorKeypadView")]) {
            CalculatorKeypadButton *button = (CalculatorKeypadButton *)[self superview];
            if ([button isKindOfClass:NSClassFromString(@"Calculator.CalculatorKeypadButton")]) {
                UIColor *cl = [UIColor blackColor];
                NSUInteger buttonID = [button calculatorButtonID]; 
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
                    _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, colorFromString(kCancel, cancelColor));
                }else{
                    CGFloat r = 0.0;
                    CGFloat g = 0.0;
                    CGFloat b = 0.0;
                    [cl getRed:&r green:&g blue:&b alpha:NULL];
                    if (r * 255 * 0.299 + g * 255 * 0.587 + b * 255 * 0.114 > 186) {
                        _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, [UIColor blackColor]);
                    }else{
                        _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, [UIColor whiteColor]);
                    }
                }
            }else{
                if (color == [UIColor blackColor]) {
                    _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, colorFromString(kCancel, cancelColor));
                }else{
                    _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, color);
                }
            }
        }else if ([[self superview] isKindOfClass:NSClassFromString(@"Calculator.DisplayView")]) {
            _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, numbersTextColor);
        }else{
            _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, color);
        }
    }else{
        _logos_orig$StaticColor$UILabel$setTextColor$(self, _cmd, color);
    }
}





static __attribute__((constructor)) void _logosLocalCtor_baf06531(int __unused argc, char __unused **argv, char __unused **envp) {
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
        {Class _logos_class$App$Delegate = objc_getClass("Calculator.AppDelegate"); MSHookMessageEx(_logos_class$App$Delegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$App$Delegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$App$Delegate$application$didFinishLaunchingWithOptions$);}
        {Class _logos_class$Model$CalculatorModel = objc_getClass("Calculator.CalculatorModel"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Model$CalculatorModel, @selector(displayValue), (IMP)&_logos_method$Model$CalculatorModel$displayValue, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Model$CalculatorModel, @selector(delegate), (IMP)&_logos_method$Model$CalculatorModel$delegate, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; memcpy(_typeEncoding + i, @encode(NSMutableArray *), strlen(@encode(NSMutableArray *))); i += strlen(@encode(NSMutableArray *)); memcpy(_typeEncoding + i, @encode(NSUInteger), strlen(@encode(NSUInteger))); i += strlen(@encode(NSUInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Model$CalculatorModel, @selector(addObject:toArray:atIndex:), (IMP)&_logos_method$Model$CalculatorModel$addObject$toArray$atIndex$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Model$CalculatorModel, @selector(operatorStringFromButtonID:), (IMP)&_logos_method$Model$CalculatorModel$operatorStringFromButtonID$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Model$CalculatorModel, @selector(functionStringFromButtonID:), (IMP)&_logos_method$Model$CalculatorModel$functionStringFromButtonID$, _typeEncoding); }MSHookMessageEx(_logos_class$Model$CalculatorModel, @selector(buttonPressed:), (IMP)&_logos_method$Model$CalculatorModel$buttonPressed$, (IMP*)&_logos_orig$Model$CalculatorModel$buttonPressed$);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSString *)); class_addMethod(_logos_class$Model$CalculatorModel, @selector(lastNumber), (IMP)&_logos_method$Model$CalculatorModel$lastNumber, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSString *)); class_addMethod(_logos_class$Model$CalculatorModel, @selector(setLastNumber:), (IMP)&_logos_method$Model$CalculatorModel$setLastNumber, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSString *)); class_addMethod(_logos_class$Model$CalculatorModel, @selector(lastOperator), (IMP)&_logos_method$Model$CalculatorModel$lastOperator, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSString *)); class_addMethod(_logos_class$Model$CalculatorModel, @selector(setLastOperator:), (IMP)&_logos_method$Model$CalculatorModel$setLastOperator, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(Stack *)); class_addMethod(_logos_class$Model$CalculatorModel, @selector(stack), (IMP)&_logos_method$Model$CalculatorModel$stack, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(Stack *)); class_addMethod(_logos_class$Model$CalculatorModel, @selector(setStack:), (IMP)&_logos_method$Model$CalculatorModel$setStack, _typeEncoding); } }
        {Class _logos_class$Value$DisplayValue = objc_getClass("Calculator.DisplayValue"); { char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSString *), strlen(@encode(NSString *))); i += strlen(@encode(NSString *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Value$DisplayValue, @selector(value), (IMP)&_logos_method$Value$DisplayValue$value, _typeEncoding); }}
        {Class _logos_class$Window$CalculatorWindow = objc_getClass("Calculator.CalculatorWindow"); MSHookMessageEx(_logos_class$Window$CalculatorWindow, @selector(backgroundColor), (IMP)&_logos_method$Window$CalculatorWindow$backgroundColor, (IMP*)&_logos_orig$Window$CalculatorWindow$backgroundColor);MSHookMessageEx(_logos_class$Window$CalculatorWindow, @selector(setBackgroundColor:), (IMP)&_logos_method$Window$CalculatorWindow$setBackgroundColor$, (IMP*)&_logos_orig$Window$CalculatorWindow$setBackgroundColor$);}
        {Class _logos_class$RootViewController$CalculatorController = objc_getClass("Calculator.CalculatorController"); MSHookMessageEx(_logos_class$RootViewController$CalculatorController, @selector(initWithNibName:bundle:), (IMP)&_logos_method$RootViewController$CalculatorController$initWithNibName$bundle$, (IMP*)&_logos_orig$RootViewController$CalculatorController$initWithNibName$bundle$);MSHookMessageEx(_logos_class$RootViewController$CalculatorController, @selector(preferredStatusBarStyle), (IMP)&_logos_method$RootViewController$CalculatorController$preferredStatusBarStyle, (IMP*)&_logos_orig$RootViewController$CalculatorController$preferredStatusBarStyle);MSHookMessageEx(_logos_class$RootViewController$CalculatorController, @selector(prefersStatusBarHidden), (IMP)&_logos_method$RootViewController$CalculatorController$prefersStatusBarHidden, (IMP*)&_logos_orig$RootViewController$CalculatorController$prefersStatusBarHidden);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(model), (IMP)&_logos_method$RootViewController$CalculatorController$model, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(displayController), (IMP)&_logos_method$RootViewController$CalculatorController$displayController, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(keypadController), (IMP)&_logos_method$RootViewController$CalculatorController$keypadController, _typeEncoding); }MSHookMessageEx(_logos_class$RootViewController$CalculatorController, @selector(viewDidLoad), (IMP)&_logos_method$RootViewController$CalculatorController$viewDidLoad, (IMP*)&_logos_orig$RootViewController$CalculatorController$viewDidLoad);MSHookMessageEx(_logos_class$RootViewController$CalculatorController, @selector(viewDidAppear:), (IMP)&_logos_method$RootViewController$CalculatorController$viewDidAppear$, (IMP*)&_logos_orig$RootViewController$CalculatorController$viewDidAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(showSettingsController), (IMP)&_logos_method$RootViewController$CalculatorController$showSettingsController, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(dismissWelcomeController), (IMP)&_logos_method$RootViewController$CalculatorController$dismissWelcomeController, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(dismissSettingsController), (IMP)&_logos_method$RootViewController$CalculatorController$dismissSettingsController, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(updateUI), (IMP)&_logos_method$RootViewController$CalculatorController$updateUI, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UISwipeGestureRecognizer *), strlen(@encode(UISwipeGestureRecognizer *))); i += strlen(@encode(UISwipeGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(toggleColorMode:), (IMP)&_logos_method$RootViewController$CalculatorController$toggleColorMode$, _typeEncoding); }MSHookMessageEx(_logos_class$RootViewController$CalculatorController, @selector(viewWillLayoutSubviews), (IMP)&_logos_method$RootViewController$CalculatorController$viewWillLayoutSubviews, (IMP*)&_logos_orig$RootViewController$CalculatorController$viewWillLayoutSubviews);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(WelcomeViewController *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(welcomeController), (IMP)&_logos_method$RootViewController$CalculatorController$welcomeController, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(WelcomeViewController *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(setWelcomeController:), (IMP)&_logos_method$RootViewController$CalculatorController$setWelcomeController, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(fakeImageView), (IMP)&_logos_method$RootViewController$CalculatorController$fakeImageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(setFakeImageView:), (IMP)&_logos_method$RootViewController$CalculatorController$setFakeImageView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImpactFeedbackGenerator *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(feedbackGenerator), (IMP)&_logos_method$RootViewController$CalculatorController$feedbackGenerator, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImpactFeedbackGenerator *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(setFeedbackGenerator:), (IMP)&_logos_method$RootViewController$CalculatorController$setFeedbackGenerator, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UINavigationController *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(settingsController), (IMP)&_logos_method$RootViewController$CalculatorController$settingsController, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UINavigationController *)); class_addMethod(_logos_class$RootViewController$CalculatorController, @selector(setSettingsController:), (IMP)&_logos_method$RootViewController$CalculatorController$setSettingsController, _typeEncoding); } }
        {Class _logos_class$ViewController$DisplayViewController = objc_getClass("Calculator.DisplayViewController"); { char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UILabel *), strlen(@encode(UILabel *))); i += strlen(@encode(UILabel *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$ViewController$DisplayViewController, @selector(valueLabel), (IMP)&_logos_method$ViewController$DisplayViewController$valueLabel, _typeEncoding); }MSHookMessageEx(_logos_class$ViewController$DisplayViewController, @selector(paste:), (IMP)&_logos_method$ViewController$DisplayViewController$paste$, (IMP*)&_logos_orig$ViewController$DisplayViewController$paste$);MSHookMessageEx(_logos_class$ViewController$DisplayViewController, @selector(longPress:), (IMP)&_logos_method$ViewController$DisplayViewController$longPress$, (IMP*)&_logos_orig$ViewController$DisplayViewController$longPress$);}
        {Class _logos_class$View$DisplayView = objc_getClass("Calculator.DisplayView"); MSHookMessageEx(_logos_class$View$DisplayView, @selector(initWithFrame:), (IMP)&_logos_method$View$DisplayView$initWithFrame$, (IMP*)&_logos_orig$View$DisplayView$initWithFrame$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$View$DisplayView, @selector(openSettings), (IMP)&_logos_method$View$DisplayView$openSettings, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$View$DisplayView, @selector(copyValue), (IMP)&_logos_method$View$DisplayView$copyValue, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$View$DisplayView, @selector(orientationChanged:), (IMP)&_logos_method$View$DisplayView$orientationChanged$, _typeEncoding); }MSHookMessageEx(_logos_class$View$DisplayView, @selector(backgroundColor), (IMP)&_logos_method$View$DisplayView$backgroundColor, (IMP*)&_logos_orig$View$DisplayView$backgroundColor);MSHookMessageEx(_logos_class$View$DisplayView, @selector(setBackgroundColor:), (IMP)&_logos_method$View$DisplayView$setBackgroundColor$, (IMP*)&_logos_orig$View$DisplayView$setBackgroundColor$);MSHookMessageEx(_logos_class$View$DisplayView, @selector(layoutSubviews), (IMP)&_logos_method$View$DisplayView$layoutSubviews, (IMP*)&_logos_orig$View$DisplayView$layoutSubviews);MSHookMessageEx(_logos_class$View$DisplayView, @selector(addSubview:), (IMP)&_logos_method$View$DisplayView$addSubview$, (IMP*)&_logos_orig$View$DisplayView$addSubview$);MSHookMessageEx(_logos_class$View$DisplayView, @selector(addGestureRecognizer:), (IMP)&_logos_method$View$DisplayView$addGestureRecognizer$, (IMP*)&_logos_orig$View$DisplayView$addGestureRecognizer$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UILabel *), strlen(@encode(UILabel *))); i += strlen(@encode(UILabel *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$View$DisplayView, @selector(valueLabel), (IMP)&_logos_method$View$DisplayView$valueLabel, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UILabel *), strlen(@encode(UILabel *))); i += strlen(@encode(UILabel *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$View$DisplayView, @selector(modeLabel), (IMP)&_logos_method$View$DisplayView$modeLabel, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(CAShapeLayer *)); class_addMethod(_logos_class$View$DisplayView, @selector(bottomSeparator), (IMP)&_logos_method$View$DisplayView$bottomSeparator, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(CAShapeLayer *)); class_addMethod(_logos_class$View$DisplayView, @selector(setBottomSeparator:), (IMP)&_logos_method$View$DisplayView$setBottomSeparator, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(CopyButtonView *)); class_addMethod(_logos_class$View$DisplayView, @selector(copyButtonView), (IMP)&_logos_method$View$DisplayView$copyButtonView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(CopyButtonView *)); class_addMethod(_logos_class$View$DisplayView, @selector(setCopyButtonView:), (IMP)&_logos_method$View$DisplayView$setCopyButtonView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$View$DisplayView, @selector(historyLabel), (IMP)&_logos_method$View$DisplayView$historyLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$View$DisplayView, @selector(setHistoryLabel:), (IMP)&_logos_method$View$DisplayView$setHistoryLabel, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UINotificationFeedbackGenerator *)); class_addMethod(_logos_class$View$DisplayView, @selector(feedbackGenerator), (IMP)&_logos_method$View$DisplayView$feedbackGenerator, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UINotificationFeedbackGenerator *)); class_addMethod(_logos_class$View$DisplayView, @selector(setFeedbackGenerator:), (IMP)&_logos_method$View$DisplayView$setFeedbackGenerator, _typeEncoding); } }
        {Class _logos_class$KeyPadController$KeyPadViewController = objc_getClass("Calculator.KeypadViewController"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$KeyPadController$KeyPadViewController, @selector(activeKeypad), (IMP)&_logos_method$KeyPadController$KeyPadViewController$activeKeypad, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$KeyPadController$KeyPadViewController, @selector(basicKeypad), (IMP)&_logos_method$KeyPadController$KeyPadViewController$basicKeypad, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$KeyPadController$KeyPadViewController, @selector(scientificKeypad), (IMP)&_logos_method$KeyPadController$KeyPadViewController$scientificKeypad, _typeEncoding); }}
        {Class _logos_class$KeyPad$KeyPadView = objc_getClass("Calculator.CalculatorKeypadView"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$KeyPad$KeyPadView, @selector(buttons), (IMP)&_logos_method$KeyPad$KeyPadView$buttons, _typeEncoding); }}
        {Class _logos_class$Button$CalculatorKeypadButton = objc_getClass("Calculator.CalculatorKeypadButton"); { char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(BOOL), strlen(@encode(BOOL))); i += strlen(@encode(BOOL)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Button$CalculatorKeypadButton, @selector(isActive), (IMP)&_logos_method$Button$CalculatorKeypadButton$isActive, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Button$CalculatorKeypadButton, @selector(calculatorButtonID), (IMP)&_logos_method$Button$CalculatorKeypadButton$calculatorButtonID, _typeEncoding); }MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(setFrame:), (IMP)&_logos_method$Button$CalculatorKeypadButton$setFrame$, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$setFrame$);MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(layoutSubviews), (IMP)&_logos_method$Button$CalculatorKeypadButton$layoutSubviews, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$layoutSubviews);MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(backgroundColor), (IMP)&_logos_method$Button$CalculatorKeypadButton$backgroundColor, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$backgroundColor);MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(setBackgroundColor:), (IMP)&_logos_method$Button$CalculatorKeypadButton$setBackgroundColor$, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$setBackgroundColor$);MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(drawRect:), (IMP)&_logos_method$Button$CalculatorKeypadButton$drawRect$, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$drawRect$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UILabel *), strlen(@encode(UILabel *))); i += strlen(@encode(UILabel *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Button$CalculatorKeypadButton, @selector(label), (IMP)&_logos_method$Button$CalculatorKeypadButton$label, _typeEncoding); }MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(isOpaque), (IMP)&_logos_method$Button$CalculatorKeypadButton$isOpaque, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$isOpaque);MSHookMessageEx(_logos_class$Button$CalculatorKeypadButton, @selector(setOpaque:), (IMP)&_logos_method$Button$CalculatorKeypadButton$setOpaque$, (IMP*)&_logos_orig$Button$CalculatorKeypadButton$setOpaque$);}
        {Class _logos_class$Highlight$HighlightView = objc_getClass("_TtCC10Calculator22CalculatorKeypadButton13HighlightView"); MSHookMessageEx(_logos_class$Highlight$HighlightView, @selector(drawRect:), (IMP)&_logos_method$Highlight$HighlightView$drawRect$, (IMP*)&_logos_orig$Highlight$HighlightView$drawRect$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UIColor *), strlen(@encode(UIColor *))); i += strlen(@encode(UIColor *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Highlight$HighlightView, @selector(fillColor), (IMP)&_logos_method$Highlight$HighlightView$fillColor, _typeEncoding); }MSHookMessageEx(_logos_class$Highlight$HighlightView, @selector(isOpaque), (IMP)&_logos_method$Highlight$HighlightView$isOpaque, (IMP*)&_logos_orig$Highlight$HighlightView$isOpaque);MSHookMessageEx(_logos_class$Highlight$HighlightView, @selector(setOpaque:), (IMP)&_logos_method$Highlight$HighlightView$setOpaque$, (IMP*)&_logos_orig$Highlight$HighlightView$setOpaque$);{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Highlight$HighlightView, @selector(calculatorButtonID), (IMP)&_logos_method$Highlight$HighlightView$calculatorButtonID, _typeEncoding); }MSHookMessageEx(_logos_class$Highlight$HighlightView, sel_registerName("dealloc"), (IMP)&_logos_method$Highlight$HighlightView$dealloc, (IMP*)&_logos_orig$Highlight$HighlightView$dealloc);}
        if (!wantsOriginalFont) {
            {Class _logos_class$StaticFont$UILabel = objc_getClass("UILabel"); MSHookMessageEx(_logos_class$StaticFont$UILabel, @selector(font), (IMP)&_logos_method$StaticFont$UILabel$font, (IMP*)&_logos_orig$StaticFont$UILabel$font);MSHookMessageEx(_logos_class$StaticFont$UILabel, @selector(setFont:), (IMP)&_logos_method$StaticFont$UILabel$setFont$, (IMP*)&_logos_orig$StaticFont$UILabel$setFont$);MSHookMessageEx(_logos_class$StaticFont$UILabel, @selector(_defaultAttributes), (IMP)&_logos_method$StaticFont$UILabel$_defaultAttributes, (IMP*)&_logos_orig$StaticFont$UILabel$_defaultAttributes);MSHookMessageEx(_logos_class$StaticFont$UILabel, @selector(_setDefaultAttributes:), (IMP)&_logos_method$StaticFont$UILabel$_setDefaultAttributes$, (IMP*)&_logos_orig$StaticFont$UILabel$_setDefaultAttributes$);MSHookMessageEx(_logos_class$StaticFont$UILabel, @selector(attributedText), (IMP)&_logos_method$StaticFont$UILabel$attributedText, (IMP*)&_logos_orig$StaticFont$UILabel$attributedText);MSHookMessageEx(_logos_class$StaticFont$UILabel, @selector(setAttributedText:), (IMP)&_logos_method$StaticFont$UILabel$setAttributedText$, (IMP*)&_logos_orig$StaticFont$UILabel$setAttributedText$);}
        }
        {Class _logos_class$StaticColor$UILabel = objc_getClass("UILabel"); MSHookMessageEx(_logos_class$StaticColor$UILabel, @selector(setTextColor:), (IMP)&_logos_method$StaticColor$UILabel$setTextColor$, (IMP*)&_logos_orig$StaticColor$UILabel$setTextColor$);}
    }
}
