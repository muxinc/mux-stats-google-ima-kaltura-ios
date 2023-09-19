
Pod::Spec.new do |s|
  s.name                    = 'Mux-Stats-Google-IMA-Kaltura'
  s.version                 = '2.0.0'
  s.summary                 = 'Mux-Stats-Google-IMA-Kaltura is for tracking performance analytics and QoS monitoring for video with mux.com.'
  
  s.description             = <<-DESC
  The Mux-Stats-Google-IMA-Kaltura is designed to be used with Mux-Stats-Kaltura and GoogleAds-IMA-iOS-SDK to track performance analytics and QoS monitoring for video.
                          DESC

  s.module_name             = 'MUXSDKStatsGoogleIMAKaltura'

  s.homepage                = 'https://mux.com'
  s.social_media_url        = 'https://twitter.com/muxhq'
  s.license                 = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author                  = { 'Mux' => 'ios-sdk@mux.com' }
  s.source                  = { :git => 'https://github.com/muxinc/mux-stats-google-ima-kaltura-ios.git', 
                              :tag => "v#{s.version}" }

  s.ios.deployment_target   = '13.0'
  s.tvos.deployment_target  = '13.0'
  s.swift_version           = '5.9'

  s.source_files            = 'MUXSDKImaKalturaListener/Sources/**/*'

  s.ios.dependency 'Mux-Stats-Kaltura', '~> 3.0'
  s.ios.dependency 'PlayKit_IMA'

  s.tvos.dependency 'Mux-Stats-Kaltura', '~> 3.0'
  s.tvos.dependency 'PlayKit_IMA', '~> 1.14'

  s.pod_target_xcconfig     = {
    'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'
  }

  s.user_target_xcconfig    = {
    'EXCLUDED_ARCHS[sdk=appletvsimulator*]' => 'arm64'
  }

  # <em> This only works on x86 machines due to problems upstream. We can rely on the PR checks for now
  #  (as of: 3/17/2023)
  #s.test_spec 'Tests' do |test_spec|
  #  test_spec.source_files = 'MUXSDKImaKalturaListener/Tests/*'
  #  test_spec.scheme = { 
  #    :launch_arguments => ["TEST"]
  #  }
  #end
end
