//
//  MUXSDKImaKalturaListener.swift
//  Mux-Stats-Google-IMA-Kaltura
//
//  Created by Stephanie Zuñiga on 27/1/22.
//

import MUXSDKKaltura
import MuxCore
import PlayKit
import GoogleInteractiveMediaAds

public class MUXSDKImaKalturaListener {
    private let dispatcher: MUXSDKImaKalturaDispatcher
    private let player: Player
    
    public init(playerBinding: MUXSDKPlayerBinding, player: Player) {
        var isTesting: Bool {
            return ProcessInfo.processInfo.arguments.contains("TEST")
        }
        
        self.dispatcher = isTesting ? MockedDispatcher.shared : MUXSDKImaKalturaMainDispatcher(playerBinding: playerBinding)
        self.player = player
    }
    
    public func start() {
        let events: [PKEvent.Type] = [
            AdEvent.adDidRequestContentPause,
            AdEvent.adDidRequestContentResume,
            AdEvent.adLoaded,
            AdEvent.adStarted,
            AdEvent.adFirstQuartile,
            AdEvent.adMidpoint,
            AdEvent.adThirdQuartile,
            AdEvent.adSkipped,
            AdEvent.adComplete,
            AdEvent.adPaused,
            AdEvent.adResumed,
            AdEvent.error
        ]
        
        self.player.addObserver(self, events: events) { event in
            self.dispatch(event: event)
        }
    }
    
    private func dispatch(event: PKEvent) {
        var playbackEvents = [MUXSDKPlaybackEvent]()
        
        switch event {
        case is AdEvent.AdDidRequestContentPause:
            playbackEvents.append(MUXSDKAdBreakStartEvent())
            playbackEvents.append(MUXSDKAdRequestEvent())
        case is AdEvent.AdDidRequestContentResume:
            playbackEvents.append(MUXSDKAdBreakEndEvent())
        case is AdEvent.AdLoaded:
            playbackEvents.append(MUXSDKAdResponseEvent())
            playbackEvents.append(MUXSDKAdPlayEvent())
        case is AdEvent.AdStarted:
            playbackEvents.append(MUXSDKAdPlayingEvent())
        case is AdEvent.AdFirstQuartile:
            playbackEvents.append(MUXSDKAdFirstQuartileEvent())
        case is AdEvent.AdMidpoint:
            playbackEvents.append(MUXSDKAdMidpointEvent())
        case is AdEvent.AdThirdQuartile:
            playbackEvents.append(MUXSDKAdThirdQuartileEvent())
        case is AdEvent.AdSkipped, is AdEvent.AdComplete:
            playbackEvents.append(MUXSDKAdEndedEvent())
        case is AdEvent.AdPaused:
            playbackEvents.append(MUXSDKAdPauseEvent())
        case is AdEvent.AdResumed:
            playbackEvents.append(MUXSDKAdPlayEvent())
            playbackEvents.append(MUXSDKAdPlayingEvent())
        case is AdEvent.Error:
            playbackEvents.append(MUXSDKAdErrorEvent())
        default:
            return
        }
        
        for playbackEvent in playbackEvents {
            // Set ad view data
            let viewData = MUXSDKViewData()

            if let info = event.adInfo, info.positionType == .preRoll {
                viewData.viewPrerollAdId = info.adId
                viewData.viewPrerollCreativeId = info.creativeAdId
            }
            
            playbackEvent.viewData = viewData
            
            // Dispatch event to MUXCore
            self.dispatcher.dispatch(playbackEvent)
        }
    }
}
