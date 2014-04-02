#import <Mantle/Mantle.h>

@class DUNTimelineUserMessage;

@interface DUNTimeline : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, readonly, strong) NSDate *startedAt;
@property (nonatomic, strong) NSMutableArray *messages;

- (void) updateMessage:(DUNTimelineUserMessage*)message;

@end
