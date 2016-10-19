Pod::Spec.new do |s|
  s.name             = 'SunbeamSecurity'
  s.version          = '0.1.1'
  s.summary          = 'SunbeamSecurity is base on CocoaSecurity and make it easy for use.'
  s.homepage         = 'https://github.com/sunbeamChen/SunbeamSecurity'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sunbeamChen' => 'sunbeamhome@163.com' }
  s.source           = { :git => 'https://github.com/sunbeamChen/SunbeamSecurity.git', :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.source_files = 'SunbeamSecurity/Classes/**/*'
  s.public_header_files = 'SunbeamSecurity/Classes/SunbeamSecurity.h','SunbeamSecurity/Classes/SunbeamSecurityService.h'
end
