Pod::Spec.new do |s|
  s.name = 'SunbeamSecurity'
  s.version = '0.1.4'
  s.summary = 'SunbeamSecurity is base on CocoaSecurity and make it easy for use.'
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"sunbeamChen"=>"sunbeamhome@163.com"}
  s.homepage = 'https://github.com/sunbeamChen/SunbeamSecurity'
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.preserve_paths       = 'ios/SunbeamSecurity.framework'
  s.ios.public_header_files  = 'ios/SunbeamSecurity.framework/Versions/A/Headers/*.h'
  s.ios.resource             = 'ios/SunbeamSecurity.framework/Versions/A/Resources/**/*'
  s.ios.vendored_frameworks  = 'ios/SunbeamSecurity.framework'
end
