//
//  MainView.m
//  SnakeTouch
//
//  Created by kingtrust kingtrust on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "Nut.h"
CGPoint lastLoction;
BOOL moveChanged;
@implementation MainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        UITapGestureRecognizer* doubleRecognizer;
        doubleRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dbclick)] autorelease];
        doubleRecognizer.numberOfTapsRequired = 2; // 双击
        [self addGestureRecognizer:doubleRecognizer];
        // Initialization code
    }
    return self;    

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dbclick{
    [Nut pauseGame];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    lastLoction = location;
    moveChanged = NO;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self];
    if(!moveChanged && (fabs(location.x - lastLoction.x) > 25 || fabs(location.y - lastLoction.y) > 25)){
        moveChanged = YES;
        
   
        
        if((fabs(location.x - lastLoction.x)-fabs(location.y - lastLoction.y))>0){
            //horizon
                if(location.x - lastLoction.x >0){//right
                    
                    if (dx!= -1) {
                        dx = 1;
                        dy = 0;
                        NSLog(@"this right");
                    }
                    
                }else{//left
                    if (dx != 1) {
                        dx = -1;
                        dy = 0;
                        NSLog(@"this left");
                    }
  
                }
        }else{
            //veritical
                if(location.y - lastLoction.y >0){//right
                    if (dy != -1) {
                        dx = 0;
                        dy = 1;
                        NSLog(@"this down");
                    }

                }else{//left
                    
                    if (dy !=1) {
                        dx = 0;
                        dy = -1;
                        NSLog(@"this up");
                    }

                }
        }
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInView:self];
    lastLoction = location;
    
}



@end
