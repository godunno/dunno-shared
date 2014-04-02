#import <Mantle/Mantle.h>

@interface DUNTimelinePoll : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *question;

@property (nonatomic, readonly, strong) NSArray *options;

@end
