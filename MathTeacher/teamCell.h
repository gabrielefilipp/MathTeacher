//
//  conferoTeamCell.h
//  Confero2
//
//  Created by gabriele filipponi on 12/09/16.
//
//

#import "peopleView.h"
#import <Preferences/PSTableCell.h>

@interface teamCell : PSTableCell
@property (nonatomic, strong) NSMutableArray<peopleView *>*people;
@end
