//
//  Header.h
//  MathTeacher
//
//  Created by gabriele filipponi on 10/06/2019.
//

#ifndef Header_h
#define Header_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AudioToolBox/AudioToolBox.h>
#import "CopyButtonView.h"
#import "BadLabel.h"
#import "Stack.h"
#import "WelcomeViewController.h"
#import "MathTeacherPreferencesController.h"

#define plist @"/var/mobile/Library/Preferences/com.peppa.MathTeacher.plist"

#define wantsOriginalFont YES

#define kDarkMode @"mathteacher_darkmode"
#define kOldLayout @"mathteacher_oldlayout"
#define kWelcome @"mathteacher_welcome"
#define kAnimation @"mathteacher_animaton"
#define kCancel @"mathteacher_cancelcolor"
#define kResult @"mathteacher_resultcolor"
#define kBasicKeypad @"mathteacher_basickeypadcolor"
#define kScientificKeypad @"mathteacher_scientifickeypadcolor"
#define kOperators @"mathteacher_operatorscolor"
#define kActiveOperators @"mathteacher_operatorsactivecolor"

#define additive 5.0
#define fontSizeOfHistoryLabel 22
#define fontName @"Arial Rounded MT Bold"
#define numbersTextColorWhite [UIColor colorWithRed:68.0/255.0 green:68.0/255.0 blue:68.0/255.0 alpha:1.0]
#define numbersTextColor [[NSUserDefaults standardUserDefaults] boolForKey:kDarkMode] ? [UIColor whiteColor] : numbersTextColorWhite
#define backColor [[NSUserDefaults standardUserDefaults] boolForKey:kDarkMode] ? [UIColor blackColor] : [UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0]
#define resultColor [UIColor colorWithRed:57.0/255.0 green:151.0/255.0 blue:220.0/255.0 alpha:1.0]
#define cancelColor [UIColor colorWithRed:220.0/255.0 green:75.0/255.0 blue:90.0/255.0 alpha:1.0]
#define alphaChannelForOperators [[NSUserDefaults standardUserDefaults] boolForKey:kDarkMode] ? 0.0 : 0.15
#define alphaChannelForOthers [[NSUserDefaults standardUserDefaults] boolForKey:kDarkMode] ? 0.0 : 0.6
#define textOffset(str, original) [fontName isEqualToString:@"Arial Rounded MT Bold"] ? ([[str string] isEqualToString:@"−"] ? @(2.5) : @(0)) : original
#define lineColor [UIColor colorWithRed:200.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:0.6]

@class CalculatorModel;

@interface NSObject (Private)
- (NSString*)_methodDescription;
@end

@interface UIDevice (MathTeacher)
@property (getter=_feedbackSupportLevel,nonatomic,readonly) long long feedbackSupportLevel;
@end

@interface UIView (MathTeacher)
-(UIViewController *)_viewControllerForAncestor;
@end

@interface CalculatorKeypadButton : UIView
@property (nonatomic, assign) NSInteger calculatorButtonID;
@property (nonatomic, assign) NSInteger accessibilityCalculatorButtonID;
@property (nonatomic, assign, getter=isActive) BOOL active;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSAttributedString *attributedText;
-(UILabel *)label;
@end

@interface CalculatorKeyPadView : UIView
@property (nonatomic, strong) NSArray<CalculatorKeypadButton *>*buttons;
@property (nonatomic, strong) NSArray<CalculatorKeypadButton *>*accessibilityCalculatorButtons;
@end

@interface CalculatorKeyPadController : UIViewController
@property (nonatomic, strong) CalculatorKeyPadView *activeKeypad;
@property (nonatomic, strong) CalculatorKeyPadView *accessibilityActiveKeypad;
@property (nonatomic, strong) CalculatorKeyPadView *basicKeypad;
@property (nonatomic, strong) CalculatorKeyPadView *scientificKeypad;
@end

@interface DisplayViewController : UIViewController
-(UILabel *)valueLabel;
-(void)paste:(id)arg;
@end

@interface DisplayView : UIView
@property (nonatomic, strong) CAShapeLayer *bottomSeparator;
@property (nonatomic, strong) CopyButtonView *copyButtonView;
@property (nonatomic, strong) UILabel *accessibilityValueLabel;
@property (nonatomic, strong) BadLabel *historyLabel;
@property (nonatomic, strong) UINotificationFeedbackGenerator *feedbackGenerator;
-(UILabel *)valueLabel;
-(UILabel *)modeLabel;
@end

@interface CalculatorController : UIViewController
@property (nonatomic, strong) CalculatorKeyPadController *keypadController;
@property (nonatomic, strong) DisplayViewController *displayController;
@property (nonatomic, strong) CalculatorKeyPadController *accessibilityKeypadController;
@property (nonatomic, strong) DisplayViewController *accessibilityDisplayController;
@property (nonatomic, strong) CalculatorModel *model;
@property (nonatomic, strong) WelcomeViewController *welcomeController;
@property (nonatomic, strong) UINavigationController *settingsController;
@property (nonatomic, strong) UIImpactFeedbackGenerator *feedbackGenerator;
-(void)showSettingsController;
-(void)updateUI;
@end

@interface HighlightView : UIView
-(NSInteger)calculatorButtonID;
-(UIColor *)fillColor;
@end

@interface DisplayValue : NSObject
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *accessibilityStringValue;
@property (nonatomic, assign) BOOL userEntered;
@end

@interface CalculatorModel : NSObject
@property (nonatomic, assign) NSInteger lastButtonTapped;
@property (nonatomic, strong) CalculatorController *delegate;
@property (nonatomic, strong) DisplayValue *displayValue;
@property (nonatomic, strong) DisplayValue *accessibilityDisplayValue;
@property (nonatomic, strong) NSString *lastNumber;
@property (nonatomic, strong) NSString *lastOperator;
@property (nonatomic, strong) Stack *stack;
-(void)addObject:(id)objc toArray:(NSMutableArray *)array atIndex:(NSUInteger)index;
-(NSString *)operatorStringFromButtonID:(NSInteger)button;
-(NSString *)functionStringFromButtonID:(NSInteger)button;
-(void)buttonPressed:(NSInteger)button;
@end

#endif /* Header_h */
