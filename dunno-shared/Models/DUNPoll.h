#import <Mantle/Mantle.h>

@interface DUNPoll : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *content;

@property (nonatomic, readonly, strong) NSArray *options;

@end
