#
# Be sure to run `pod lib lint AALocalizationKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AALocalizationKit'
  s.version          = '1.1'
  s.summary          = 'AALocalizationKit is a great localization manager that is written in pure swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
AALocalizationKit is really helpful to maintain multiple languages in the application with their custom language fonts and an ability to change the language within your application! With this, you can easily configured framework to configure multiple languages in the iOS application.
                       DESC

  s.homepage         = 'https://github.com/EngrAhsanAli/AALocalizationKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EngrAhsanAli' => 'hafiz.m.ahsan.ali@gmail.com' }
  s.source           = { :git => 'https://github.com/EngrAhsanAli/AALocalizationKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'AALocalizationKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AALocalizationKit' => ['AALocalizationKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
