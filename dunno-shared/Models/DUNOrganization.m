#import "DUNOrganization.h"
#import "DUNCourse.h"

@implementation DUNOrganization

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{};
}

+ (NSValueTransformer *)coursesJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNCourse.class];
}



@end