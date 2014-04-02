#import "DUNStudent.h"
#import "DUNEvent.h"

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

+ (NSValueTransformer *)eventsJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNEvent.class];
}


@end