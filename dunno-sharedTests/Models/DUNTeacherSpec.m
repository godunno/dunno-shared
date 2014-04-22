#import <Specta/Specta.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>


#import "DUNTeacher.h"
#import "DUNCourse.h"
#import "DUNEvent.h"

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
  
  describe(@"#events", ^{
    
    it(@"should collect events from courses", ^{
      DUNCourse *course = mock(DUNCourse.class);
      [given(course.events) willReturn:@[mock(DUNEvent.class),mock(DUNEvent.class),mock(DUNEvent.class)]];
      DUNCourse *course2 = mock(DUNCourse.class);
      [given(course2.events) willReturn:@[mock(DUNEvent.class),mock(DUNEvent.class),mock(DUNEvent.class)]];
      teacher.courses = @[course, course2];
      
      expect([teacher events].count).to.equal(6);
    });
    
  });
  
});




SpecEnd
