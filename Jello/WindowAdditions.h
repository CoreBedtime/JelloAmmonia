//
//  SBSWindowAdditions.h
//  JelloInject
//
//  Created by Dennis Collaris on 21/07/2017.
//  Copyright © 2017 collaris. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#ifdef __cplusplus
extern "C" {
#endif
  typedef int CGSWindow;
  typedef int CGSConnection;
  
  extern CGSConnection _CGSDefaultConnection();
  
  typedef struct {
    float x;
    float y;
  } MeshPoint;
  
  typedef struct {
    MeshPoint local;
    MeshPoint global;
  } CGPointWarp;
#ifdef __cplusplus
}
#endif

static BOOL gWindowTrackingEnabled = YES;
static BOOL gWindowTracking = YES;
static NSPoint gWindowTrackingEventOrigin, gWindowTrackingCurrentWindowOrigin;

@class Warp;

@interface NSWindow (WindowAdditions)
@property (weak, nonatomic) Warp *warp;

- (void) drawWarp;
- (void) clearWarp;
+ (void) setLiveFrameTracking:(BOOL) bol;
+ (BOOL) isLiveFrameTracking;

@end
