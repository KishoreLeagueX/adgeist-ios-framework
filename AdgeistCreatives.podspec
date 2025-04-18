Pod::Spec.new do |s|
  s.name             = 'AdgeistCreatives'
  s.version          = '1.0.8'
  s.summary          = 'AdGeist iOS SDK'
  s.description      = 'AdGeist tracking and attribution SDK for iOS apps'
  s.homepage         = 'https://github.com/KishoreLeagueX/adgeist-ios-framework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'kishore' => 'kishore@thealteroffice.com' }
  s.platform         = :ios, '11.0'
  s.source           = { :git => 'https://github.com/KishoreLeagueX/adgeist-ios-framework.git', :tag => "#{s.version}"}

  s.ios.deployment_target = '12.0'

  s.vendored_frameworks = 'output/AdgeistCreatives.xcframework'
  s.requires_arc = true

  s.pod_target_xcconfig = {
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'DEFINES_MODULE' => 'YES'
  }

  s.swift_version = '5.0'
end 

