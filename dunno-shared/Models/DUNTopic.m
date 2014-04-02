#import "DUNTopic.h"

@implementation DUNTopic

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return @{@"entityId":@"id",
           @"title": @"description"};
}

@end
