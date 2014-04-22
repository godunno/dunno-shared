#import <Specta/Specta.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>

#import <Mantle/Mantle.h>

#import "DUNEvent.h"

SpecBegin(DUNEvent)

__block DUNEvent *event;

beforeEach(^{
  event = [DUNEvent new];
});

describe(@"is a MTLModel", ^{
    expect([event isKindOfClass:[MTLModel class]]).to.beTruthy();
});

SpecEnd
