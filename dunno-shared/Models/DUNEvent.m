#import "DUNEvent.h"
#import "DUNTopic.h"
#import "DUNThermometer.h"
#import "DUNPoll.h"
#import "DUNMedia.h"
#import "DUNTimeline.h"

#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

@implementation DUNEvent

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{
            @"startAt" : @"start_at",
            @"channelName" : @"channel",
            @"releasePollEvent" : @"release_poll_event",
            @"closeEvent" : @"close_event",
            @"studentMessageEvent" : @"student_message_event",
            @"upDownVoteMessageEvent" : @"up_down_vote_message_event",
            @"upDownVoteMessageEvent" : @"up_down_vote_message_event",
          };
}

+ (NSValueTransformer *)statusJSONTransformer
{
  return [MTLValueTransformer transformerWithBlock:^id(id inObj) {
    if([(NSString*)inObj isEqualToString:@"opened"])
      return @(DUNEventOpened);
    else if([(NSString*)inObj isEqualToString:@"closed"])
      return @(DUNEventClosed);
    else
      return @(DUNEventAvailable);
  }];
}

+ (NSValueTransformer *)startAtJSONTransformer {
  ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];

  return [MTLValueTransformer transformerWithBlock:^id(id str) {
    return [formatter dateFromString:str];
  }];
}

+ (NSValueTransformer *)timelineJSONTransformer {
  return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNTimeline.class];
}

+ (NSValueTransformer *)courseJSONTransformer {
  return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNCourse.class];
}

+ (NSValueTransformer *)topicsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNTopic.class];
}

+ (NSValueTransformer *)thermometersJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNThermometer.class];
}

+ (NSValueTransformer *)pollsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNPoll.class];
}

+ (NSValueTransformer *)mediasJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNMedia.class];
}

@end

