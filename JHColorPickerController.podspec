#
# Be sure to run `pod lib lint JHColorPickerController.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "JHColorPickerController"
  s.version          = "1.0.2"
  s.summary          = "Color picker with several swatch libraries and custom color picker"
  s.description      = <<-DESC
                       JHColorPickerController is a color picker that includes swatches from Crayola, Pantone, and ChameleonFramework flat colors, as well as custom color picker
                       DESC
  s.homepage         = "https://github.com/jhays/JHColorPickerController"
  s.screenshots      = "http://i.imgur.com/egH6Thw.gif"
  s.license          = 'MIT'
  s.author           = { "JHays" => "julian@devmode.com" }
  s.source           = { :git => "https://github.com/jhays/JHColorPickerController.git", :tag => "v1.0.2" }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JHColorPickerController' => ['Pod/Assets/*.png','Pod/Assets/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'ChameleonFramework/Swift'
  s.dependency 'UIColor-Crayola'
  s.dependency 'UIColor-Pantone'
  s.dependency 'ColorUtils'
end
