
Pod::Spec.new do |s|
  s.name         = "ExpandCategory"
  s.version      = "0.0.1"
  s.summary      = "基础UIkit库做的类拓展，对系统控件...进行拓展，方便开发使用"
  s.description  = <<-DESC
                   Custom Category used on iOS, which implement by Objective-C.
                   DESC
  s.homepage     = "https://github.com/1039289948/ExpandCategory"
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = "MIT"
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = { "Alexkaixuan" => "kaixuangogo@qq.com" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "7.0"
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :git => "https://github.com/1039289948/ExpandCategory.git", :tag => s.version }
  s.source_files     = 'ZXCategory/**/*'
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.requires_arc = true

# NSExpand 和 UIExpand 在工程中以子目录显示
# s.subspec 'NSExpand' do |ss|
#       ss.source_files = 'NSExpand/*.{h,m}'
#   end
#   s.subspec 'UIExpand' do |ss|
#       ss.source_files = 'UIExpand/*.{h,m}'
#   end

end
