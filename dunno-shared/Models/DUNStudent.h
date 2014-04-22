#import <Mantle/Mantle.h>

@interface DUNStudent : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSString * avatarURLString;
@property (nonatomic, readonly, copy) NSString *authToken;

@property (nonatomic, strong) NSArray *courses;

- (NSArray*)events;

@end