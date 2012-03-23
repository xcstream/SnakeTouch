//
//  Nut.m
//  SnakeTouch
//
//  Created by kingtrust kingtrust on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Nut.h"

@implementation Nut

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(void)slideUp{
    
    
}
+(void)slideDown{
    
    
}
+(void)slideLeft{
    
    
}
+(void)slideReght{
    
    
}


+(void)alert:(NSString*)string{
    
    UIAlertView* al =[[UIAlertView alloc] initWithTitle:@"Oh" message:string delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [al show];
    [al release];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
+(void)pauseGame{
//    if ([timer respondsToSelector:@selector(invalidate)]) {
//        [timer invalidate];
//    }
    NSLog(@"pause");
    currentState = 999;
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Snack" message:@"Game Paused" delegate:mainVC cancelButtonTitle:nil otherButtonTitles:@"Resume", nil];
    al.tag = 1666;
    [al show];
    [al release];
}

@end
