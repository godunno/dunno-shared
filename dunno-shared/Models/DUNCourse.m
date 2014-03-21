#import "DUNCourse.h"

@implementation DUNCourse

+(JSONKeyMapper*)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{
              @"start_date": @"startAt",
              @"start_time": @"startTime",
              @"end_date": @"endAt",
              @"end_time": @"endTime",
         }];
}

@end
