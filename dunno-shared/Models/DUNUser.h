#import "JSONModel.h"

@interface DUNUser : NSObject

@property (nonatomic, copy) NSString *entityId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString<Optional> * avatarURLString;

@end
