#
#  Be sure to run `pod spec lint FYHelper.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "FYHelper"
  s.version      = "0.2.0"
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
  s.author          = { "FengYiyi" => "iosfeng@163.com" }
  s.platform        = :ios
  s.ios.deployment_target = '8.0'
  s.requires_arc    = true
  s.source          = { :git => "https://github.com/iosfeng/FYHelper.git", :tag => "#{s.version}" }

  # s.source_files = 'FYHelper/**/*'

  s.source_files = 'FYHelper/FYHelper.h'

  # s.public_header_files = 'FYHelper/FYHelper.h'
  # s.public_header_files = 'FYHelper/*.h'

  # s.default_subspecs = 'FYCategory', 'FYInstall', 'FYSubclass', 'FYUIKit', 'FYUtil'


   # s.default_subspecs = 'FYSubclass' # , 'FYUtil'

   s.subspec 'FYSubclass' do |ss|
     ss.source_files = 'FYHelper/FYSubclass/**/*'
     ss.public_header_files = 'FYHelper/FYSubclass/**/*.h'
   end

   s.subspec 'FYUtil' do |ss|
     ss.source_files = 'FYHelper/FYUtil/**/*'
     ss.public_header_files = 'FYHelper/FYUtil/**/*.h'
     # ss.dependency 'FYHelper/FYCategory'
   end

    s.subspec 'FYInstall' do |ss|
      ss.source_files = 'FYHelper/FYInstall/**/*'
      ss.public_header_files = 'FYHelper/FYInstall/**/*.h'
      ss.dependency 'FYHelper/FYUtil'
    end

    s.subspec 'FYUIKit' do |ss|
      ss.source_files = 'FYHelper/FYUIKit/**/*'
      ss.public_header_files = 'FYHelper/FYUIKit/**/*.h'
      ss.dependency 'FYHelper/FYUtil'
    end

   s.subspec 'FYCategory' do |ss|
     ss.source_files = 'FYHelper/FYCategory/**/*'
     ss.public_header_files = 'FYHelper/FYCategory/**/*.h'
     ss.dependency 'FYHelper/FYUtil'
   end


   # s.subspec 'FYSubclass' do |ss|
   #   ss.source_files = 'FYHelper/FYSubclass/**/*'
   #   ss.public_header_files = 'FYHelper/FYSubclass/**/*.h'
   # end

   # s.subspec 'FYUtil' do |ss|
   #   ss.source_files = 'FYHelper/FYUtil/**/*'
   #   ss.public_header_files = 'FYHelper/FYUtil/**/*.h'
   # end

#  s.default_subspecs = 'FYSubclass'
#  s.subspec 'FYSubclass' do |ss|
#    ss.source_files = 'FYHelper/FYSubclass/**/*'
#    ss.public_header_files = 'FYHelper/FYSubclass/**/*.h'
#  end

  s.frameworks      = 'Foundation', 'CoreGraphics', 'UIKit'
  s.dependency 'AFNetworking'
  s.dependency 'Bugly'
  s.dependency 'FLEX'
  # s.dependency 'FMDB'
  s.dependency 'KVOController'
  s.dependency 'Masonry'
  s.dependency 'pop'
  s.dependency 'iVersion'
  s.dependency 'CocoaLumberjack'
  # s.dependency 'DZNEmptyDataSet'

end
