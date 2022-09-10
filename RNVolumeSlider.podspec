require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'RNVolumeSlider'
  s.version        = package['version']
  s.summary        = package['summary']
  s.description    = package['description']
  s.summary        = 'React Native Slider'
  s.author         = 'ifour'
  s.license        = package['license']
  s.homepage       = package['homepage']
  s.source         = { :git => 'https://github.com/ifours/react-native-volume-slider.git', :tag => "v#{s.version}" }
  s.requires_arc   = true
  s.platform       = :ios, '8.0'
  s.preserve_paths = 'README.md', 'package.json', 'index.js'
  s.source_files   = 'ios/**/*.{h,m}'
  s.dependency     'React'
end