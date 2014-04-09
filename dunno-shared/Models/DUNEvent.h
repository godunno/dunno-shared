#import "DUNCourse.h"
#import "DUNTimeline.h"

#import <Mantle/Mantle.h>

typedef NS_ENUM(NSInteger, DUNEventStatus) {
  DUNEventAvailable,
  DUNEventOpened,
  DUNEventClosed
};

@interface DUNEvent : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, assign) DUNEventStatus status;
@property (nonatomic, readonly, copy) NSString *duration;
@property (nonatomic, readonly, strong) NSDate *startAt;

@property (nonatomic, readonly, strong) DUNTimeline *timeline;
@property (nonatomic, readonly, strong) DUNCourse *course;
@property (nonatomic, readonly, strong) NSArray *topics;
@property (nonatomic, readonly, strong) NSArray *thermometers;
@property (nonatomic, readonly, strong) NSArray *polls;

//pusher properties
@property (nonatomic, readonly, copy) NSString *channelName;
@property (nonatomic, readonly, copy) NSString *studentMessageEvent;
@property (nonatomic, readonly, copy) NSString *upDownVoteMessageEvent;
@property (nonatomic, readonly, copy) NSString *closeEvent;
@property (nonatomic, readonly, copy) NSString *releasePollEvent;

@end