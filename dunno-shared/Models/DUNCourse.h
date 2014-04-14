#import <Mantle/Mantle.h>

#import "DUNTeacher.h"
#import "DUNOrganization.h"

@interface DUNCourse :  MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *classroom;

@property (nonatomic, readonly, strong) NSString *startAt;
@property (nonatomic, readonly, copy) NSString *startTime;
@property (nonatomic, readonly, strong) NSString *endAt;
@property (nonatomic, readonly, copy) NSString *endTime;
@property (nonatomic, readonly, strong) NSArray *weekdays;

@property (nonatomic, readonly, strong) DUNOrganization *organization;
@property (nonatomic, readonly, strong) DUNTeacher *teacher;
@property (nonatomic, readonly, strong) NSMutableArray *events;
@property (nonatomic, readonly, strong) NSArray *students;

@end