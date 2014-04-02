#import <Mantle/Mantle.h>

@class DUNStudent;

@interface DUNTimelineUserMessage : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly, copy) NSNumber *entityId;
@property (nonatomic, strong) DUNStudent *owner;
@property (nonatomic, readonly, copy) NSString *content;
@property (nonatomic, strong) NSDate *sentAt;

@property (nonatomic, readonly, assign) NSNumber *upVotes;
@property (nonatomic, readonly, assign) NSNumber *downVotes;

@property (nonatomic, copy, getter=isAlreadyVoted) NSString *alreadyVoted;

- (instancetype) initWithContent:(NSString*)content;

- (void) addOneUpVote;
- (void) addOneDownVote;

- (BOOL)alreadyUpVoted;
- (BOOL)alreadyDownVoted;

@end