#import <Pusher/Pusher.h>

typedef void (^DUNPusherEventBlockHandler)(NSDictionary *jsonDictionary);

@interface DUNPusher : NSObject<PTPusherDelegate>

@property (strong, nonatomic) PTPusher *client;

+ (DUNPusher*) sharedInstance;

- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(DUNPusherEventBlockHandler)handler;

- (void) unsubscribe:(NSString*)channelName;

@end
