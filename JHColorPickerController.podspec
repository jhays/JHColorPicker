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
  s.version          = "0.1.0"
  s.summary          = "Color picker with several swatch libraries and custom color picker"
  s.description      = <<-DESC
                       JHColorPickerController is a color picker that includes swatches from Crayola, Pantone, and ChameleonFramework flat colors, as well as custom color picker
                       DESC
  s.homepage         = "https://github.com/jhays/JHColorPickerController"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "JHays" => "julian@devmode.com" }
  s.source           = { :git => "https://github.com/jhays/JHColorPickerController.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JHColorPickerController' => ['Pod/Assets/gradient.png','Pod/Assets/JHColorPickerController.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
