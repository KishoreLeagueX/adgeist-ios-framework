Pod::Spec.new do |s|
  s.name             = 'AdgeistCreatives'
  s.version          = '1.0.0'
  s.summary          = 'AdGeist iOS SDK'
  s.description      = 'AdGeist tracking and attribution SDK for iOS apps'
  s.homepage         = 'https://github.com/KishoreLeagueX/adgeist-ios-framework'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = { 'kishore' => 'kishore@thealteroffice.com' }
  s.platform         = :ios, '11.0'
  s.vendored_frameworks = 'AdgeistCreatives.xcframework'
  s.source           = {
    :http => 'https://github.com/KishoreLeagueX/adgeist-ios-framework/blob/main/output/AdgeistCreatives.xcframework.zip?raw=true'
  }
  s.requires_arc = true
end
