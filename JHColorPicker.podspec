Pod::Spec.new do |s|
  s.name             = "JHColorPicker"
  s.version          = "1.1"
  s.summary          = "Color picker with several swatch libraries and custom color picker"
  s.description      = <<-DESC
                       JHColorPickerController is a color picker that includes swatches from Crayola, Pantone, and ChameleonFramework flat colors, as well as custom color picker
                       DESC
  s.homepage         = "https://github.com/jhays/JHColorPicker"
  s.screenshots      = "http://i.imgur.com/egH6Thw.gif"
  s.license          = 'MIT'
  s.author           = { "JHays" => "orbosphere@gmail.com" }
  s.source           = { :git => "https://github.com/jhays/JHColorPicker.git", :tag => s.version }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'JHColorPicker' => ['Pod/Assets/*.png','Pod/Assets/*.xib']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'ChameleonFramework/Swift'
  s.dependency 'UIColor-Crayola'
  s.dependency 'UIColor-Pantone'
  s.dependency 'ColorUtils'
end
