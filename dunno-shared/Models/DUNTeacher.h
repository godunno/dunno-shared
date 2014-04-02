#import <Mantle/Mantle.h>

@interface DUNTeacher : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSString *avatarURLString;
@property (nonatomic, readonly, copy) NSString *authToken;

@property (nonatomic, readonly, strong) NSArray *courses;

@end