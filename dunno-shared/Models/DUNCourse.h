#import "JSONModel.h"
#import "DUNStudent.h"
#import "DUNTeacher.h"
#import "DUNEvent.h"

@class DUNOrganization;

@protocol DUNCourse
@end

@interface DUNCourse : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *createdAt;

@property (nonatomic, strong) DUNOrganization<Optional> *organization;
@property (nonatomic, strong) DUNTeacher *teacher;
@property (nonatomic, strong) NSArray<DUNEvent, Optional> *events;
@property (nonatomic, strong) NSArray<DUNStudent, Optional> *students;

@end
