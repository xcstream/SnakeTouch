//
//  ViewController.h
//  SnakeTouch
//
//  Created by kingtrust kingtrust on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "Nut.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>{
    NSMutableDictionary* dictColor;
    NSMutableArray* snack;
    int headx,heady;
}
-(void)addGrids;
-(void)editGridWithColor:(UIColor*) color x:(int) x y:(int) y;

@end
