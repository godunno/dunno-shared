#import "DUNTimelineUserMessage.h"
#import "DUNStudent.h"

#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

@implementation DUNTimelineUserMessage

- (instancetype) initWithContent:(NSString*)content
{
  self = [DUNTimelineUserMessage init];
  _content = content;
  
  return self;
}

- (void) addOneUpVote
{
  _upVotes = [NSNumber numberWithInt:[self.upVotes intValue] + 1];
}

- (void) addOneDownVote
{
  _downVotes = [NSNumber numberWithInt:[self.downVotes intValue] + 1];
}

- (BOOL)alreadyUpVoted
{
  return [_alreadyVoted isEqualToString:@"up"];
}

- (BOOL)alreadyDownVoted
{
  return [_alreadyVoted isEqualToString:@"down"];
}

#pragma  mark -
#pragma  mark - Mantle JSON Serializer

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return  @{@"entityId":@"id",
            @"owner":@"student",
            @"sentAt":@"created_at",
            @"upVotes":@"up_votes",
            @"downVotes":@"down_votes",
            @"alreadyVoted":@"already_voted"};
}

+ (NSValueTransformer *)sentAtJSONTransformer {
  ISO8601DateFormatter *formatter = [[ISO8601DateFormatter alloc] init];
  
  return [MTLValueTransformer transformerWithBlock:^id(id str) {
    return [formatter dateFromString:str];
  }];
}

+ (NSValueTransformer *)ownerJSONTransformer {
  return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:DUNStudent.class];
}

@end
