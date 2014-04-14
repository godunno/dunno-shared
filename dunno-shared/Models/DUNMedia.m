#import "DUNMedia.h"

#import <ISO8601DateFormatter/ISO8601DateFormatter.h>


@implementation DUNMedia
#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
  return  @{@"shortDescription":@"description"};
}

+ (NSValueTransformer *)statusJSONTransformer
{
  return [MTLValueTransformer transformerWithBlock:^id(id inObj) {
    if([(NSString*)inObj isEqualToString:@"released"])
      return @(DUNMediaReleased);
    else
      return @(DUNMediaAvailable);
  }];
}

+ (NSValueTransformer *)categoryJSONTransformer
{
  return [MTLValueTransformer transformerWithBlock:^id(id inObj) {
    if([(NSString*)inObj isEqualToString:@"image"])
      return @(DUNMediaImage);
    else if([(NSString*)inObj isEqualToString:@"sound"])
      return @(DUNMediaSound);
    else if([(NSString*)inObj isEqualToString:@"video"])
      return @(DUNMediaVideo);
    else
      return nil;
  }];
}

+ (NSValueTransformer *)releasedAtJSONTransformer {
  ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
  
  return [MTLValueTransformer transformerWithBlock:^id(id str) {
    return [formatter dateFromString:str];
  }];
}


@end

