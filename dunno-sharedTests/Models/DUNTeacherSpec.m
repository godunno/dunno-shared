#import <Specta/Specta.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>


#import "DUNTeacher.h"

SpecBegin(DUNTeacher)

__block DUNTeacher *teacher;

beforeEach(^{
  teacher = [DUNTeacher new];
});

describe(@"Mantle model", ^{
  
  it(@"extend MTLModel", ^{
    expect([teacher
            isKindOfClass:[MTLModel class]]).to.beTruthy();
  });
  
  
});




SpecEnd
