#import <Mantle/Mantle.h>

#import "DUNTimelineUserMessage.h"

@interface DUNTimeline : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, readonly, strong) NSDate *startedAt;
@property (nonatomic, strong) NSMutableArray *messages;

- (void) updateMessage:(DUNTimelineUserMessage*)message;

@end
