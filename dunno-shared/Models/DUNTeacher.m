#import "DUNTeacher.h"
#import "DUNCourse.h"

@implementation DUNTeacher

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{
            @"entityId":@"id",
            @"avatarURLString": @"avatar",
            @"authToken":@"authentication_token",
            };
}

+ (NSValueTransformer *)coursesJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNCourse.class];
}

@end
