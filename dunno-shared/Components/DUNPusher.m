#import "DUNPusher.h"
#import "DUNConfig.h"

@implementation DUNPusher

+ (instancetype) sharedInstance
{
  static dispatch_once_t p = 0;
  __strong static DUNPusher *sharedObject = nil;
  dispatch_once(&p, ^{
    sharedObject = [[self alloc] init];
  });
  return sharedObject;
}

- (PTPusher *)client
{
  if(_client==nil) {
    _client = [PTPusher pusherWithKey:PUSHER_ACCESS_KEY delegate:self encrypted:NO];
    _client.reconnectDelay = 3.0;
  }
  
  return _client;
}

- (void) subscribeToChannelNamed:(NSString*)channelName withEventNamed:(NSString*)eventName handleWithBlock:(DUNPusherEventBlockHandler)handler
{
  NSParameterAssert(channelName!=nil);
  NSParameterAssert(eventName!=nil);
  
  if(self.client.connection==nil)
    [self.client connect];
  
  PTPusherChannel *channel = [self.client subscribeToChannelNamed:channelName];
  
  [channel bindToEventNamed:eventName handleWithBlock:^(PTPusherEvent *channelEvent) {
    
    if (!channelEvent.data) {
      NSLog(@"Pusher error on receive message on %@:::%@ ",channelName,channelEvent);
      handler(nil);
    } else {
      NSLog(@"Pusher received message %@:::%@ (type: %@)",channelName,channelEvent,[channelEvent.data class]);
      handler(channelEvent.data);
    }
  }];
  
}

- (void) unsubscribe:(NSString*)channelName
{
  NSParameterAssert(channelName!=nil);

  if(self.client.connection==nil)
    [self.client connect];
  
  PTPusherChannel *channel = [self.client subscribeToChannelNamed:channelName];
  [channel unsubscribe];
}


@end
