#import "DUNTimelinePoll.h"
#import "DUNPollOption.h"

@implementation DUNTimelinePoll

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{
            @"entityId": @"id",
            @"startAt":@"start_at",
            };
}

+ (NSValueTransformer *)optionsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNPollOption.class];
}

@end
