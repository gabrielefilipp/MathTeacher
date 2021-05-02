//
//  MathTeacherPreferencesController.m
//  MathTeacherPreferences
//
//  Created by gabriele filipponi on 17/06/2019.
//  Copyright (c) 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

#import "MathTeacherPreferencesController.h"
#import <Preferences/PSSpecifier.h>
#import "Header.h"
#import "teamCell.h"

@implementation MathTeacherPreferencesController

-(id)specifiers {
    if (!_specifiers) {
        PSSpecifier *darkMode = [PSSpecifier preferenceSpecifierNamed:@"Dark Mode" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:nil cell:PSSwitchCell edit:nil];
        darkMode.identifier = kDarkMode;
        
        PSSpecifier *desc_darkMode = [PSSpecifier emptyGroupSpecifier];
        [desc_darkMode setProperty:@"Enable/Disable dark mode inside the Calculator app." forKey:@"footerText"];
        
        PSSpecifier *animation = [PSSpecifier preferenceSpecifierNamed:@"Animation" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        animation.identifier = kAnimation;
        [animation setValues:@[@"fade", @"cool"] titles:@[@"Fade", @"Cool"]];
        PSSpecifier *descAnimation = [PSSpecifier emptyGroupSpecifier];
        [descAnimation setProperty:@"Set the animation type when you toggle dark mode with two fingers gesture." forKey:@"footerText"];
        
        PSSpecifier *oldLayout = [PSSpecifier preferenceSpecifierNamed:@"Old Layout" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:nil cell:PSSwitchCell edit:nil];
        oldLayout.identifier = kOldLayout;
        
        PSSpecifier *desc_oldLayout = [PSSpecifier emptyGroupSpecifier];
        [desc_oldLayout setProperty:@"Enable/Disable the layout that the Calculator app had prior of installing MathTeacher. (This requires the Calculator app to be restarted)" forKey:@"footerText"];
        
        PSSpecifier *cancelButton = [PSSpecifier preferenceSpecifierNamed:@"Cancel Button" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        cancelButton.identifier = kCancel;
        [cancelButton setValues:@[@"default", @"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"brown", @"black", @"white"] titles:@[@"Default", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Brown", @"Black", @"White"]];
        PSSpecifier *descCancelButton = [PSSpecifier emptyGroupSpecifier];
        [descCancelButton setProperty:@"Change the appearance of the AC/C button." forKey:@"footerText"];
        
        PSSpecifier *resultButton = [PSSpecifier preferenceSpecifierNamed:@"Result Button" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        resultButton.identifier = kResult;
        [resultButton setValues:@[@"default", @"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"brown", @"black", @"white"] titles:@[@"Default", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Brown", @"Black", @"White"]];
        PSSpecifier *descResultButton = [PSSpecifier emptyGroupSpecifier];
        [descResultButton setProperty:@"Change the appearance of the Result button." forKey:@"footerText"];
        
        PSSpecifier *basicKeypad = [PSSpecifier preferenceSpecifierNamed:@"Keypad" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        basicKeypad.identifier = kBasicKeypad;
        [basicKeypad setValues:@[@"default", @"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"brown", @"black", @"white"] titles:@[@"Default", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Brown", @"Black", @"White"]];
        PSSpecifier *descBasicKeypad = [PSSpecifier emptyGroupSpecifier];
        [descBasicKeypad setProperty:@"Change the appearance of the Keypad." forKey:@"footerText"];
        
        PSSpecifier *scientificKeypad = [PSSpecifier preferenceSpecifierNamed:@"Scientific Keypad" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        scientificKeypad.identifier = kScientificKeypad;
        [scientificKeypad setValues:@[@"default", @"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"brown", @"black", @"white"] titles:@[@"Default", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Brown", @"Black", @"White"]];
        PSSpecifier *descScientificKeypad = [PSSpecifier emptyGroupSpecifier];
        [descScientificKeypad setProperty:@"Change the appearance of the scientific Keypad." forKey:@"footerText"];
        
        PSSpecifier *operatorsButton = [PSSpecifier preferenceSpecifierNamed:@"Operators Buttons" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        operatorsButton.identifier = kOperators;
        [operatorsButton setValues:@[@"default", @"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"brown", @"black", @"white"] titles:@[@"Default", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Brown", @"Black", @"White"]];
        PSSpecifier *descOperatorsButton = [PSSpecifier emptyGroupSpecifier];
        [descOperatorsButton setProperty:@"Change the appearance of operators buttons." forKey:@"footerText"];
        
        PSSpecifier *operatorsActiveButton = [PSSpecifier preferenceSpecifierNamed:@"Operators Buttons" target:self set:@selector(setValue:forSpecifier:) get:@selector(valueForSpecifier:) detail:[PSListItemsController class] cell:PSLinkListCell edit:NULL];
        operatorsActiveButton.identifier = kActiveOperators;
        [operatorsActiveButton setValues:@[@"default", @"red", @"orange", @"yellow", @"green", @"blue", @"purple", @"brown", @"black", @"white"] titles:@[@"Default", @"Red", @"Orange", @"Yellow", @"Green", @"Blue", @"Purple", @"Brown", @"Black", @"White"]];
        PSSpecifier *descOperatorsActiveButton = [PSSpecifier emptyGroupSpecifier];
        [descOperatorsActiveButton setProperty:@"Change the appearance of operators buttons when they are active." forKey:@"footerText"];
        
        PSSpecifier *team = [PSSpecifier preferenceSpecifierNamed:@"" target:nil set:nil get:nil detail:nil cell:PSGroupCell edit:nil];
        [team setProperty:@"teamCell" forKey:@"headerCellClass"];
        
        _specifiers = @[desc_darkMode, darkMode, descAnimation, animation, desc_oldLayout, oldLayout, descCancelButton, cancelButton, descResultButton, resultButton, descBasicKeypad, basicKeypad, descScientificKeypad, scientificKeypad, descOperatorsButton, operatorsButton, descOperatorsActiveButton, operatorsActiveButton, [PSSpecifier emptyGroupSpecifier], team];
    }
    return _specifiers;
}

-(void)setValue:(id)value forSpecifier:(PSSpecifier *)specifier {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:specifier.identifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(id)valueForSpecifier:(PSSpecifier *)specifier {
    return [[NSUserDefaults standardUserDefaults] objectForKey:specifier.identifier];
}

@end
