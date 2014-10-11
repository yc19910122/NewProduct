//
//  Map.m
//  VOL
//
//  Created by wjl on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Map.h"

@implementation Map
@synthesize coordinate,title,subtitle;

-(id) initWithCoordinate:(CLLocationCoordinate2D) coords  
{  
    if (self = [super init]) {  
        coordinate = coords;  
    }  
    return self;  
}    

@end
