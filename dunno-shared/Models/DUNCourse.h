#import "JSONModel.h"
#import "DUNStudent.h"
#import "DUNTeacher.h"
#import "DUNOrganization.h"

@interface DUNCourse : JSONModel

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *uuid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) DUNTeacher *teacher;
@property (nonatomic, strong) DUNOrganization<Optional> *organization;
@property (nonatomic, strong) NSDate<Optional> *createdAt;

@property (nonatomic, strong) NSArray<DUNStudent, Optional> *students;

@end
