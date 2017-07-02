#
#  Be sure to run `pod spec lint FYHelper.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FYHelper"
  s.version      = "0.0.8"
  s.summary      = "iOS Dev Helper"


  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                   iOS Dev Helper, this is a base framework for me.
                   DESC

  s.homepage     = "https://github.com/iosfeng/FYHelper"
  s.license      = "MIT"
  s.author       = { "iosfeng" => "iosfeng@163.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iosfeng/FYHelper.git", :tag => "#{s.version}" }
  s.source_files = 'FYHelper/*', 'FYHelper/FYCategory/*', 'FYHelper/FYSubclass/*', 'FYHelper/FYUtil/*', 'FYHelper/FYViewController/*'
  # s.public_header_files = 'FYHelper/**/*.h'   #公开头文件地址
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
  s.requires_arc = true
  s.dependency 'AFNetworking'
  s.dependency 'CocoaLumberjack'
  s.dependency 'BuglyHotfix'

end
