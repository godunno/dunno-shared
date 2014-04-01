#import "DUNTeacher.h"

@implementation DUNTeacher

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{
            @"entityId":@"id",
            @"avatarURLString": @"avatar",
            @"authToken":@"authentication_token",
            };
}

@end
