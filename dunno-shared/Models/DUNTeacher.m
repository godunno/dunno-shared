#import "DUNTeacher.h"
#import "DUNCourse.h"

@implementation DUNTeacher

- (NSArray*)events
{
  NSMutableArray *events = [NSMutableArray array];
  [_courses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [events addObjectsFromArray:((DUNCourse*)obj).events];
  }];
  
  return events;
}

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
