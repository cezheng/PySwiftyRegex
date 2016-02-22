Pod::Spec.new do |s|
  s.name         = "PySwiftyRegex"
  s.version      = "0.2.2"
  s.license      = "MIT"
  s.summary      = "Easily deal with Regex in Swift in a Pythonic way"
  s.homepage     = "https://github.com/cezheng/PySwiftyRegex"
  s.social_media_url   = "https://twitter.com/AdamoCheng"
  s.author             = { "Ce Zheng" => "cezheng.cs@gmail.com" }
  s.source       = { :git => "https://github.com/cezheng/PySwiftyRegex.git", :tag => s.version }
  
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source_files  = "PySwiftyRegex/*.swift"

  s.requires_arc = true
end
