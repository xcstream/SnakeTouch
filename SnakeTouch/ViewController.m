//
//  ViewController.m
//  SnakeTouch
//
//  Created by kingtrust kingtrust on 12-3-23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    mainVC = self;
    dictColor = [[NSMutableDictionary alloc] init];
    [dictColor setObject:[UIColor clearColor] forKey:@" "];
    [dictColor setObject:[UIColor cyanColor] forKey:@"0"];
    [dictColor setObject:[UIColor darkGrayColor] forKey:@"*"];
    [dictColor setObject:[UIColor blueColor] forKey:@"1"];
    [dictColor setObject:[UIColor redColor] forKey:@"2"];
    [dictColor setObject:[UIColor grayColor] forKey:@"3"];
    [dictColor setObject:[UIColor greenColor] forKey:@"4"];
    [dictColor setObject:[UIColor blackColor] forKey:@"5"];
    [dictColor setObject:[UIColor blueColor] forKey:@"6"];
    [dictColor setObject:[UIColor orangeColor] forKey:@"7"];
    [self addGrids];
    [self startGame];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)startGame{
    timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(tick) userInfo:nil repeats:YES];
    currentState = 1000;
    interval = 0.3;
    [self loadLevels:@"level1"];
    
    dx = 1,dy = 0;
    snacklen = 6;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)addGrids{
    
    int x = 0;
    int y = 0;
    
    for (y = 0; y <= 480; y+=20) {
        for (x = 0; x<320; x+=20) {
            UIView* grid = [[UIView alloc] initWithFrame:CGRectMake(x, y, 20, 20)];
            grid.tag = (y/20)*999 + (x/20)+1000;
            [self.view addSubview:grid];
            [grid release];
        }
    }
    
}

-(void)editGridWithColor:(UIColor*) color x:(int) x y:(int) y{
    int tag = y*999 + x +1000;
    UIView* selectedView = [self.view viewWithTag:tag];
    
    if (selectedView) {
        selectedView.backgroundColor = color;
    }
}


-(void)snackTail:(NSString*)locationString{
    NSArray* arr = [locationString componentsSeparatedByString:@","];
    int x = [[arr objectAtIndex:0] intValue];
    int y = [[arr objectAtIndex:1] intValue];
    [self editGridWithColor:[UIColor clearColor] x:x y:y];
}

-(UIColor*)colorForGridwithX:(int)x y:(int)y{
    int tag = y*999 + x +1000;
    UIView* selectedView = [self.view viewWithTag:tag];    
    if (selectedView) {
        return selectedView.backgroundColor;
    }
    return [UIColor clearColor];
}



-(void)tick{
    
    if (currentState == 1000) {
        
        UIColor* nextColor = [self colorForGridwithX:headx+dx y:heady+dy];
        if (nextColor!=[UIColor clearColor]) {
            dx = 0;
            dy= 0;
            UIAlertView* al = [[UIAlertView alloc] initWithTitle:@"oh" message:@"Die" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Restart", nil];
            al.delegate= self;
            al.tag = 1555;
            [al show];
            [al release];
            [timer invalidate];
        }
        
        [self performSelector:@selector(snackTail:) withObject:[NSString stringWithFormat:@"%d,%d",headx,heady] afterDelay:interval*snacklen];
        
        headx+=dx;
        heady+=dy;
        
        [self editGridWithColor:[dictColor objectForKey:@"0"] x:headx y:heady];
        
    
    
    }
    
} 

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 1555) { //restart game
        [self startGame];
    }
    if (alertView.tag == 1666) { //resume game
        currentState = 1000;
    }    
}

-(void)loadLevels:(NSString*)levelString{
    NSURL *file = [[NSBundle mainBundle] URLForAuxiliaryExecutable:@"map.txt"];
    NSString* str = [NSString stringWithContentsOfURL:file encoding:NSASCIIStringEncoding error:nil];
    NSArray* arr = [str componentsSeparatedByString:@"\n"];
    int cursor = 0;
    for (NSString* line in arr) {
        if ([line hasPrefix:@"#"] && [line hasSuffix:levelString]) {
            cursor = [arr indexOfObject:line];
        }
    }
    int x = 0,y = 0;

    for (int i = cursor+1 ;i<=cursor+24;i++){
        NSString* lstr = [arr objectAtIndex:i];
        for (x = 0; x<16; x++) {
            NSRange range;
            range.length = 1;
            range.location = x;
            
            NSString *singlePoint = [lstr substringWithRange:range];
                [self editGridWithColor:[dictColor objectForKey:singlePoint] x:x y:y];
                if([singlePoint isEqualToString:@"0"]){
                    headx=x;
                    heady=y;
            }
        }
        y++;

    }
}



@end
