#import "Specta.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND
#import "Expecta.h"

#import <Mantle/Mantle.h>

#import "DUNStudent.h"
#import "DUNCourse.h"
#import "DUNEvent.h"

SpecBegin(DUNStudent)
__block DUNStudent *student;

beforeEach(^{
  student = [DUNStudent new];
});

describe(@"structure", ^{
  it(@"is a Mantle model", ^{
    expect([student isKindOfClass:[MTLModel class]]).to.beTruthy();
  });
});

describe(@"#allEvents", ^{
  
  it(@"should collect events from courses property", ^{
    DUNCourse *course = mock(DUNCourse.class);
    [given(course.events) willReturn:@[mock(DUNEvent.class),mock(DUNEvent.class),mock(DUNEvent.class)]];
    DUNCourse *course2 = mock(DUNCourse.class);
    [given(course2.events) willReturn:@[mock(DUNEvent.class),mock(DUNEvent.class),mock(DUNEvent.class)]];
    student.courses = @[course, course2];
    
    expect([student allEvents].count).to.equal(6);
  });
  
});

SpecEnd
