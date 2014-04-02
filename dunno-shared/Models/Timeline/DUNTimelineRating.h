#import <Mantle/Mantle.h>

@interface DUNTimelineRating : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSString *question;

@property (nonatomic, assign) float rating;

@end
