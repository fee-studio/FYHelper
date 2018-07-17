#
#  Be sure to run `pod spec lint FYHelper.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FYHelper"
  s.version      = "0.4.0"
  s.summary      = "iOS Dev Helper"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description     = <<-DESC
                        iOS Dev Helper, this is a base framework for me.
                        DESC

  s.homepage        = "https://github.com/iosfeng/FYHelper"
  s.license         = "MIT"
  s.author          = { "fengyiyi" => "iosfeng@163.com" }
  s.platform        = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc    = true
  s.source          = { :git => "https://github.com/iosfeng/FYHelper.git", :tag => "#{s.version}" }

  s.source_files    = 'FYHelper/Classes/FYHelper.h'

  s.subspec 'FYSubclass' do |ss|
    ss.source_files = 'FYHelper/Classes/FYSubclass/**/*'
    ss.public_header_files = 'FYHelper/Classes/FYSubclass/**/*.h'
  end

  s.subspec 'FYUtil' do |ss|
    ss.source_files = 'FYHelper/Classes/FYUtil/**/*'
    ss.public_header_files = 'FYHelper/Classes/FYUtil/**/*.h'
    # ss.dependency 'FYHelper/FYCategory'
  end

# s.subspec 'FYInstall' do |ss|
#   ss.source_files = 'FYHelper/Classes/FYInstall/**/*'
#   ss.public_header_files = 'FYHelper/Classes/FYInstall/**/*.h'
#   ss.dependency 'FYHelper/FYUtil'
# end

  s.subspec 'FYUIKit' do |ss|
    ss.source_files = 'FYHelper/Classes/FYUIKit/**/*'
    ss.public_header_files = 'FYHelper/Classes/FYUIKit/**/*.h'
    ss.dependency 'FYHelper/FYUtil'
  end

  s.subspec 'FYCategory' do |ss|
    ss.source_files = 'FYHelper/Classes/FYCategory/**/*'
    ss.public_header_files = 'FYHelper/Classes/FYCategory/**/*.h'
    ss.dependency 'FYHelper/FYUtil'
  end

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

  s.dependency 'AFNetworking'
  s.dependency 'FLEX'
  s.dependency 'KVOController'
  s.dependency 'Masonry'
  s.dependency 'pop'
  s.dependency 'iVersion'
  s.dependency 'CocoaLumberjack'

# s.dependency 'Bugly'
# s.dependency 'FMDB'
# s.dependency 'DZNEmptyDataSet'

end
