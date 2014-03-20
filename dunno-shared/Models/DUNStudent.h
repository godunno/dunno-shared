#import "DUNUser.h"

@protocol DUNStudent
@end

@interface DUNStudent : DUNUser

@property (nonatomic, copy) NSString<Optional> * avatarURLString;
@property (nonatomic, copy) NSString<Optional> *authToken;

@end
