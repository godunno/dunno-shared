#import <Mantle/Mantle.h>

@interface DUNTopic : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, readonly, copy) NSString *title;

@end
