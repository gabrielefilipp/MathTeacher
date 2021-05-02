//
//  MathTeacherPreferencesController.h
//  MathTeacherPreferences
//
//  Created by gabriele filipponi on 17/06/2019.
//  Copyright (c) 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Preferences/PSListController.h>
#import <Preferences/PSListItemsController.h>

typedef enum PSTableCellType {
    PSGroupCell,
    PSLinkCell,
    PSLinkListCell,
    PSListItemCell,
    PSTitleValueCell,
    PSSliderCell,
    PSSwitchCell,
    PSStaticTextCell,
    PSEditTextCell,
    PSSegmentCell,
    PSGiantIconCell,
    PSGiantCell,
    PSSecureEditTextCell,
    PSButtonCell,
    PSEditTextViewCell
} PSSpecifierType;

@interface MathTeacherPreferencesController : PSListController
@end
