#import <Mantle/Mantle.h>

typedef NS_ENUM(NSInteger, DUNPollStatus) {
  DUNPollAvailable,
  DUNPollReleased,
};


@interface DUNPoll : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *content;
@property (nonatomic, assign) DUNPollStatus status;
@property (nonatomic, readonly, strong) NSDate *releaseddAt;

@property (nonatomic, readonly, strong) NSArray *options;

@end
