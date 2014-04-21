#import "Specta.h"

#define EXP_SHORTHAND
#import "Expecta.h"

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#import "DUNPusher.h"

SpecBegin(DUNPusher)

__block PTPusher *client;
__block DUNPusher *pusher;

beforeEach(^{
  pusher = [DUNPusher new];
  client = mock(PTPusher.class);
  pusher.client = client;
});

describe(@"subscribe event", ^{
  
  it(@"fail if channel name is nil", ^{
    NSString *channelName = nil;
    NSString *eventName = @"fooevent";
    
    MKTArgumentCaptor *argument = [[MKTArgumentCaptor alloc] init];

    [verifyCount(client, times(0)) subscribeToChannelNamed:channelName];
    
    expect([pusher subscribeToChannelNamed:channelName withEventNamed:eventName handleWithBlock:argument.capture]).to.raise(@"error");
    
  });

  it(@"fail if event name is nil", ^{
    NSString *channelName = @"foo";
    NSString *eventName = nil;
    
    MKTArgumentCaptor *argument = [[MKTArgumentCaptor alloc] init];
    
    expect([pusher subscribeToChannelNamed:channelName withEventNamed:eventName handleWithBlock:[argument capture]]).to.raise(@"AssertException");
    
    [verifyCount(client, times(0)) subscribeToChannelNamed:channelName];
  });
  
});


describe(@"unsubscribe event", ^{
  it(@"fail if channel name is nil", ^{
    NSString *channelName = nil;
    
    [pusher unsubscribe:channelName];
    
    [verifyCount(client, times(0)) subscribeToChannelNamed:channelName];
  });
  
  it(@"fail if channel name is nil", ^{
    NSString *channelName = @"foochannel";
    
    PTPusherChannel *pusherChannelMock = mock(PTPusherChannel.class);
    [given([client subscribeToChannelNamed:channelName]) willReturn:pusherChannelMock];
    
    [pusher unsubscribe:channelName];

    [verifyCount(pusherChannelMock, times(1)) unsubscribe];
  });
});

SpecEnd
