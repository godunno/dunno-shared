#import <Mantle/Mantle.h>

@interface DUNOrganization : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *name;

@property (nonatomic, readonly, strong) NSArray *courses;

@end
