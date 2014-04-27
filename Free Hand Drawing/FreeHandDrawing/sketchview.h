//
//  sketchview.h
//  sketch
//
//  Created by  Rajkumar tcs on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface sketchview : UIView

@property(nonatomic,retain) NSMutableArray *linearray;
@property(nonatomic,assign) CGPoint start;

//TODO
-(void) clear;
-(IBAction)undo:(id)sender;
-(IBAction)cut:(id)sender;


@end
