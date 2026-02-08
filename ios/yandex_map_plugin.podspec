Pod::Spec.new do |s|
  s.name             = 'yandex_map_plugin'
  s.version          = '0.0.1'
  s.summary          = 'Initializes Yandex MapKit Lite for Flutter apps'
  s.description      = <<-DESC
A Flutter plugin that automatically initializes Yandex MapKit Lite on iOS.
Reads the API key from Info.plist and sets it up before the map is used.
                       DESC
  s.homepage         = 'https://github.com/Sarkhan07/yandex_mapkit_lite_initializer'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'YandexMapsMobile', '4.4.0-lite'
  s.platform         = :ios, '12.0'
  s.swift_version    = '5.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
