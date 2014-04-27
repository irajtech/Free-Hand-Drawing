//
//  sketchview.m
//  sketch
//
//  Created by  Rajkumar tcs on 7/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "sketchview.h"
#import "line.h"

@implementation sketchview
@synthesize start, linearray;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{	
	if((self =[super initWithCoder:aDecoder]))
	{
		linearray=[[NSMutableArray alloc] init];
		self.multipleTouchEnabled = NO;		
	}
	return self;
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *t=[touches anyObject];
	self.start=[t locationInView:self];
	
}


-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *t=[touches anyObject];
	CGPoint end=[t locationInView:self];
	
	line *newline=[[line alloc] init];
	newline.begin=self.start;
	newline.end=end;
	self.start=end;
	
	[linearray addObject:newline];
	[self setNeedsDisplay];	
}



-(void) drawRect:(CGRect)rect
{
	CGContextRef mycontext= UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(mycontext, 4.0);

	for( line *line in linearray)
	{
		CGContextMoveToPoint(mycontext, line.begin.x, line.begin.y);
		CGContextAddLineToPoint (mycontext, line.end.x, line.end.y);
		CGContextStrokePath(mycontext);
	}
}


-(void) clear
{
	[linearray removeLastObject];
	
	[self setNeedsDisplay];	
}


-(IBAction)undo:(id)sender

{
	NSInteger size = [linearray count];
	
	
	if( size > 0)
	{
		
		[linearray removeLastObject];
		
		[self setNeedsDisplay];
		
	}
	else {
		NSLog(@" do nothing");
	}
	
	
	
}
	
-(IBAction)cut:(id)sender
{
	[linearray removeAllObjects];
	[self setNeedsDisplay];
	
}
			 
			


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

@end
