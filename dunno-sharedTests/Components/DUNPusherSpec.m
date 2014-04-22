#import <Specta/Specta.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

#import "DUNPusher.h"

SpecBegin(DUNPusher)

__block PTPusher *clientMock;
__block DUNPusher *pusher;

describe(@"subscribeToChannelNamed:withEventNamed:handleWithBlock:", ^{
  __block NSString *channelName = @"channel-foo";
  __block NSString *eventName = @"event-foo";
  
  before(^{
    pusher = [DUNPusher new];
    clientMock = mock([PTPusher class]);
    pusher.client = clientMock;
  });
  
  it(@"fail if channelName is nil", ^{
    MKTArgumentCaptor *blockHandle = [[MKTArgumentCaptor alloc] init];
    
    expect(^{[pusher subscribeToChannelNamed:nil withEventNamed:eventName handleWithBlock:[blockHandle capture]];}).to.raise(@"NSInternalInconsistencyException");
  });
  it(@"fail if eventName is nil", ^{
    MKTArgumentCaptor *blockHandle = [[MKTArgumentCaptor alloc] init];
    
    expect(^{[pusher subscribeToChannelNamed:channelName withEventNamed:nil handleWithBlock:[blockHandle capture]];}).to.raise(@"NSInternalInconsistencyException");
  });
  
  it(@"connect if still disconnected", ^{
    MKTArgumentCaptor *blockHandle = [[MKTArgumentCaptor alloc] init];
    
    [pusher subscribeToChannelNamed:channelName withEventNamed:eventName handleWithBlock:[blockHandle capture]];
    [verify(clientMock) connect];
  });
  
  it(@"subscribe event on channel", ^{
    PTPusherChannel *channelMock = mock([PTPusherChannel class]);
    [given([clientMock subscribeToChannelNamed:channelName]) willReturn:channelMock];
    
    //prevent retain cycle with __weak
    __weak MKTArgumentCaptor *blockHandle = [[MKTArgumentCaptor alloc] init];
    [pusher subscribeToChannelNamed:@"channel-foo" withEventNamed:@"event-foo" handleWithBlock:[blockHandle capture]];
    
    MKTArgumentCaptor *blockWithEventDataHandle = [[MKTArgumentCaptor alloc] init];
    [verify(channelMock) bindToEventNamed:eventName handleWithBlock:[blockWithEventDataHandle capture]];
  });
  
  describe(@"#unsubscribe:", ^{
    it(@"fail if channelName is nil", ^ {
      expect(^{[pusher unsubscribe:nil];}).to.raise(@"NSInternalInconsistencyException");
    });
    
    it(@"connect if still disconnected", ^{
      [pusher unsubscribe:channelName];
      [verify(clientMock) connect];
    });
    
    it(@"successful",^{
      PTPusherChannel *channelMock = mock([PTPusherChannel class]);
      [given([clientMock subscribeToChannelNamed:channelName]) willReturn:channelMock];
      
      [pusher unsubscribe:channelName];
      
      [verify(channelMock) unsubscribe];
    });
    
  });
  
});

SpecEnd
