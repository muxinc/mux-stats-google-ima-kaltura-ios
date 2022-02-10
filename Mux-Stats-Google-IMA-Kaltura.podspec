
Pod::Spec.new do |s|
  s.name             = 'Mux-Stats-Google-IMA-Kaltura'
  s.version          = '1.0.0'
  s.summary          = 'Mux-Stats-Google-IMA-Kaltura is for tracking performance analytics and QoS monitoring for video with mux.com.'
  
  s.description      = <<-DESC
  The Mux-Stats-Google-IMA-Kaltura is designed to be used with Mux-Stats-Kaltura and GoogleAds-IMA-iOS-SDK to track performance analytics and QoS monitoring for video.
                       DESC

                       s.homepage         = 'https://mux.com'
                       s.social_media_url = 'https://twitter.com/muxhq'
                       s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
                       s.author           = { 'Mux' => 'ios-sdk@mux.com' }
                       s.source           = { :git => 'https://github.com/muxinc/mux-stats-google-ima-kaltura-ios.git', :tag => "v#{s.version}" }

  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'MUXSDKImaKalturaListener/Sources/**/*'

  s.ios.dependency 'Mux-Stats-Kaltura', '~> 1.1.1'
  s.ios.dependency 'PlayKit_IMA'

  s.tvos.dependency 'Mux-Stats-Kaltura', '~> 1.1.1'
  s.tvos.dependency 'PlayKit_IMA'

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'
  }

  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'
  }

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'MUXSDKImaKalturaListener/Tests/*'
    test_spec.scheme = { 
      :launch_arguments => ["TEST"]
    }
  end
end