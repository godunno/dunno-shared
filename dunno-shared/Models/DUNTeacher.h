#import "DUNUser.h"
#import <Mantle/Mantle.h>

@interface DUNTeacher : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *entityId;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *email;
@property (nonatomic, readonly, copy) NSString *avatarURLString;

@end
