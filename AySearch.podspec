

Pod::Spec.new do |spec|

spec.name         = "AySearch"
spec.version      = "1.0.1"
spec.summary      = "AySearch is a greate framework"
spec.description  = <<-DESC
This CocoaPods library helps you perform Search
DESC
spec.homepage     = "https://github.com/ArslaniOS/AySearchs"
spec.license      = "MIT"
spec.author             = { "Xeven Dev" => "Arslanyahya700@gmail.com" }
spec.ios.deployment_target = "15.0"
spec.swift_version = "5.0"
spec.source       = { :git => "https://github.com/ArslaniOS/AySearchs.git", :tag => spec.version.to_s }
spec.source_files  = "AySearch/**/*.{h,m,swift}"

end
