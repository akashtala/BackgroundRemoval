#
# Be sure to run `pod lib lint BackgroundRemoval.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BackgroundRemoval'
  s.version          = '0.0.1'
  s.summary          = 'A pod that help developer remove background from image.'

  s.description      = "BackgroundRemover is a lightweight and efficient Swift library that removes white or solid color backgrounds from images. Ideal for creating transparent PNGs, sticker apps, or improving image processing workflows.
  
  Features:
  ✅ Removes white or specific color backgrounds from images although remove non static color backgrounds
  ✅ Supports UIImage and CIImage inputs
  ✅ Adjustable tolerance for better accuracy
  ✅ Fast and optimised for iOS devices
  ✅ Simple and easy-to-use API"

  s.homepage         = 'https://github.com/akashtala/BackgroundRemoval'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Akash Tala' => 'akashpatel54668@gmail.com' }
  s.source           = { :git => 'https://github.com/akashtala/BackgroundRemoval.git', :tag => s.version.to_s }
#   s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/**/*.swift'
  s.resources = "Sources/**/*.mlmodelc"
  # s.resource_bundles = {
  #   'BackgroundRemoval' => ['BackgroundRemoval/Assets/*.png']
  # }
end
