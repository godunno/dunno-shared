#import "DUNPoll.h"
#import "DUNPollOption.h"

@implementation DUNPoll

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{};
}

+ (NSValueTransformer *)optionsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNPollOption.class];
}

@end
