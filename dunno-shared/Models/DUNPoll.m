#import "DUNPoll.h"
#import "DUNPollOption.h"

#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

@implementation DUNPoll

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return  @{};
}

+ (NSValueTransformer *)optionsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNPollOption.class];
}

+ (NSValueTransformer *)statusJSONTransformer
{
  return [MTLValueTransformer transformerWithBlock:^id(id inObj) {
    if([(NSString*)inObj isEqualToString:@"released"])
      return @(DUNPollReleased);
    else
      return @(DUNPollAvailable);
  }];
}

+ (NSValueTransformer *)releasedAtJSONTransformer {
  ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
  
  return [MTLValueTransformer transformerWithBlock:^id(id str) {
    return [formatter dateFromString:str];
  }];
}


@end
