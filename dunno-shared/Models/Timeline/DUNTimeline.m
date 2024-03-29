#import "DUNTimeline.h"
#import "DUNTimelineUserMessage.h"

@implementation DUNTimeline

- (void) updateMessage:(DUNTimelineUserMessage*)message
{
  NSParameterAssert(message!=nil);
  NSParameterAssert(message.entityId!=nil);
  
  [_messages enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    DUNTimelineUserMessage* m = (DUNTimelineUserMessage*)obj;
    if(message.entityId == m.entityId){
      [_messages replaceObjectAtIndex:idx withObject:message];
      *stop = TRUE;
    }
  }];
}

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{
            @"entityId": @"id",
            @"startAt":@"start_at",
            };
}

+ (NSValueTransformer *)messagesJSONTransformer {
  return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:DUNTimelineUserMessage.class];
}

@end
