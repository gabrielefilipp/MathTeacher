//
//  conferoTeamCell.m
//  Confero2
//
//  Created by gabriele filipponi on 12/09/16.
//
//

#import "teamCell.h"
#import <Preferences/Preferences.h>

@implementation teamCell

- (id)initWithSpecifier:(PSSpecifier *)specifier {
    if ((self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"teamHeaderCell" specifier:specifier])) {
        self.backgroundColor = [UIColor clearColor];
        [self setUserInteractionEnabled:YES];
        self.people = [[NSMutableArray alloc] init];
        for (int i = 0; i < 1; i++) {
            peopleView *people = [[peopleView alloc] init];
            switch (i) {
                case 0:
                    people.imageView.image = [UIImage imageWithContentsOfFile:@"/Library/Application Support/MathTeacher/folpo.png"];
                    people.launchURL = @"gabrielefilipp5";
                    people.name.text = @"Gabriele Filipponi";
                    people.role.text = @"Developer";
                    break;
            }
            [self.people addObject:people];
            [self addSubview:people];
        }
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    float size = 70.0;
    float space = (self.frame.size.width - size * [self.people count]) / ([self.people count] + 1);
    float x = space;
    for (peopleView *people in self.people) {
        people.frame = CGRectMake(x, 0.0, size, [self preferredHeightForWidth:0.0]);
        x = x + space + size;
    }
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1 {
    return 131.f;
}

-(void)_setHiddenForReuse:(BOOL)arg {
    [super _setHiddenForReuse:NO];
}

@end
