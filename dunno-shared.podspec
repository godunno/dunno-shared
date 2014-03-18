Pod::Spec.new do |s|

  s.name         = "dunno-shared"
  s.version      = "0.0.1"
  s.summary      = "A short description of dunno-shared."

  s.description  = <<-DESC
			shared lib with common classes to dunno project
                   DESC

  s.homepage     = "http://www.dunno.vc"
  s.author             = { "Fagner Moura" => "fagnermoura@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source_files = "dunno-shared", "dunno-shared/**/*.{h,m}"
  s.public_header_files = "dunno-shared/**/*.h"
  s.source       = :path => "../dunno-shared"
  #s.source       = :git => "https://github.com/godunno/dunno-shared"


end
