#import <Mantle/Mantle.h>

@interface DUNPollOption : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *content;

@end
