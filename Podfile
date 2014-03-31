platform :ios, "7.0"

inhibit_all_warnings!

xcodeproj "dunno-shared"

target "dunno-shared" do
  # network
  pod 'AFNetworking', '~> 1.0'
  pod 'Reachability', '~> 3.1.1'
  pod 'SDWebImage', '~> 3.5'
  
  #dates
  pod 'ISO8601DateFormatter', '~> 0.7'
  pod 'NSDate+Calendar'
  
  #other
  pod 'JSONModel'
  pod 'libPusher', '~> 1.4'
end

target "dunno-sharedTests" do
  pod 'Specta',      '~> 0.2.1'
  pod 'Expecta',     '~> 0.2.3'
  pod 'OCMockito',   '~> 1.0.0'
end

