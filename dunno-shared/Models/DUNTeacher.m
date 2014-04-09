#import "DUNTeacher.h"
#import "DUNCourse.h"
#import "DUNEvent.h"

@implementation DUNTeacher

- (NSArray*)events
{
  NSMutableArray *events = [NSMutableArray array];
  [_courses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [events addObjectsFromArray:((DUNCourse*)obj).events];
  }];
  
  return events;
}

- (void) updateEvent:(DUNEvent*)event
{
  NSMutableArray *events = [NSMutableArray array];
  [_courses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    DUNCourse *c = obj;
    [c.events enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      DUNEvent *e = obj;
      if([e.uuid isEqualToString:event.uuid])
      {
        [c.events replaceObjectAtIndex:idx withObject:event];
        return;
      }
    }];
  }];
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
