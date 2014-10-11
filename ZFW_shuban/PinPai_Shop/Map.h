//
//  Map.h
//  VOL
//
//  Created by wjl on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Map : NSObject
<MKAnnotation>  
{  
    CLLocationCoordinate2D coordinate;  
    NSString *title;  
    NSString *subtitle;  
}  
-(id) initWithCoordinate:(CLLocationCoordinate2D) coords;  

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;  
@property (nonatomic, copy) NSString *title;  
@property (nonatomic, copy) NSString *subtitle;  
@end
