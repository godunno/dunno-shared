#import "DUNStudent.h"
#import "DUNCourse.h"

@implementation DUNStudent

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return @{@"entityId":@"id",
           @"avatarURLString":@"avatar",
           @"authToken":@"authentication_token",
           };
}

+ (NSValueTransformer *)coursesJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNCourse.class];
}


- (NSArray*)allEvents
{
  NSMutableArray *events = [NSMutableArray array];
  [_courses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [events addObjectsFromArray:((DUNCourse*)obj).events];
  }];
  return events;
}

@end