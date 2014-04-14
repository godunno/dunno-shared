#import <Mantle/Mantle.h>

typedef NS_ENUM(NSInteger, DUNMediaStatus) {
  DUNMediaAvailable,
  DUNMediaReleased,
};

typedef NS_ENUM(NSInteger, DUNMediaCategory) {
  DUNMediaImage,
  DUNMediaVideo,
  DUNMediaSound,
};

@interface DUNMedia : MTLModel<MTLJSONSerializing>
@property (nonatomic, readonly, copy) NSString *uuid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *shortDescription;
@property (nonatomic, assign) DUNMediaCategory category;
@property (nonatomic, assign) DUNMediaStatus status;
@property (nonatomic, copy) NSString *url;

@property (nonatomic, readonly, strong) NSDate *releaseddAt;
@end
