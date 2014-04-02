#import "DUNCourse.h"
#import "DUNEvent.h"
#import "DUNStudent.h"

@implementation DUNCourse

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{
            @"entityId": @"id",
            @"startAt":@"start_date",
            @"startTime": @"start_time",
            @"endAt": @"end_date",
            @"endTime":@"end_time",
            };
}

+ (NSValueTransformer *)eventsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNEvent.class];
}

+ (NSValueTransformer *)teacherJSONTransformer {
  return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNTeacher.class];
}

+ (NSValueTransformer *)organizationJSONTransformer {
  return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNOrganization.class];
}

+ (NSValueTransformer *)studentsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNStudent.class];
}

@end