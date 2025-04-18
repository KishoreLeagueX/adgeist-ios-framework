Pod::Spec.new do |s|
  s.name             = 'AdgeistCreatives'
  s.version          = '1.0.2'
  s.summary          = 'AdGeist iOS SDK'
  s.description      = 'AdGeist tracking and attribution SDK for iOS apps'
  s.homepage         = 'https://github.com/KishoreLeagueX/adgeist-ios-framework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'kishore' => 'kishore@thealteroffice.com' }
  s.platform         = :ios, '11.0'
  s.source           = { :git => 'https://github.com/KishoreLeagueX/adgeist-ios-framework.git', :tag => "#{s.version}"}

  s.source_files  = "AdgeistCreatives/**/*.{swift,h,m}"

  s.ios.deployment_target = '12.0'

  s.vendored_frameworks = 'output/AdgeistCreatives.xcframework'
  s.pod_target_xcconfig = {
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }

  s.requires_arc = true
end 
