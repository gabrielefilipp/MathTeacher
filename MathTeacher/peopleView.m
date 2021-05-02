//
//  conferoPeopleView.m
//  Confero2
//
//  Created by gabriele filipponi on 12/09/16.
//
//

#import "peopleView.h"

@implementation peopleView

-(id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setUserInteractionEnabled:YES];
        
        self.imageView = [[UIImageView alloc] init];
        self.imageView.layer.masksToBounds = YES;
        self.imageView.backgroundColor = [UIColor clearColor];
        [self.imageView setUserInteractionEnabled:YES];
        [self addSubview:self.imageView];
        
        self.name = [[UILabel alloc] init];
        self.name.textAlignment = NSTextAlignmentCenter;
        self.name.font = [UIFont systemFontOfSize:15.0];
        self.name.textColor = [UIColor colorWithRed:79.0/255.0 green:175.0/255.0 blue:216.0/255.0 alpha:1.0];
        [self addSubview:self.name];
        
        self.role = [[UILabel alloc] init];
        self.role.textAlignment = NSTextAlignmentCenter;
        self.role.font = [UIFont systemFontOfSize:13.0];
        self.role.textColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        [self addSubview:self.role];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(launchApp)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)layoutSubviews {
    self.imageView.frame = CGRectMake(2.0, 0.0, self.frame.size.width - 4.0, self.frame.size.width - 4.0);
    self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2.0;
    
    [self.name sizeToFit];
    self.name.frame = CGRectMake((self.frame.size.width - self.name.frame.size.width) / 2.0, self.imageView.frame.origin.y + self.imageView.frame.size.height + 5.0, self.name.frame.size.width, 15.0);
    self.role.frame = CGRectMake(-5.0, self.name.frame.origin.y + self.name.frame.size.height, self.frame.size.width + 10.0, 15.0);
}

-(void)launchApp {
    if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tweetbot:///user_profile/%@", self.launchURL]]];
    } else if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"tweetings:"]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tweetings:///user?screen_name=%@", self.launchURL]]];
    } else if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"twitter://user?screen_name=%@", self.launchURL]]];
    } else {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://twitter.com/intent/follow?screen_name=%@", self.launchURL]]];
    }
}

@end
