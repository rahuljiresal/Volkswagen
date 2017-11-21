
Pod::Spec.new do |s|
  s.name             = 'Volkswagen'
  s.version          = '0.1.0'
  s.summary          = 'Detect when your app is in review and automatically hide features that Apple would reject.'

  s.description      = <<-DESC
  Detect when your app is in review and automatically hide features that Apple would reject.
  Volkswagen checks the latest available version on the AppStore. If the current version of the app is newer than the AppStore
  version, it assumes that the app is in review.
                       DESC

  s.homepage         = 'https://github.com/rahuljiresal/Volkswagen'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rahuljiresal' => 'rahul.jiresal@gmail.com' }
  s.source           = { :git => 'https://github.com/rahuljiresal/Volkswagen.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/rahuljiresal'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Volkswagen/Classes/**/*'
end
