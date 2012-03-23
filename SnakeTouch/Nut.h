//
//  Nut.h
//  SnakeTouch
//
//  Created by kingtrust kingtrust on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewController;
ViewController* mainVC;
int currentState;

NSTimer *timer;
int dx,dy;
int snacklen;
float interval;

@interface Nut : NSObject


+(void)slideUp;
+(void)slideDown;
+(void)slideLeft;
+(void)slideReght;
+(void)pauseGame;
+(void)alert:(NSString*)string;
@end
