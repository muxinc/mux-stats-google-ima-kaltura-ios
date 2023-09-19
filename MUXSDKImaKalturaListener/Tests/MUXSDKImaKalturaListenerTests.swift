//
//  MUXSDKImaKalturaListenerTests.swift
//  Mux-Stats-Google-IMA-Kaltura
//
//  Created by Stephanie Zuñiga on 3/02/22.
//  Copyright © 2022 Mux, Inc. All rights reserved.
//

import XCTest
@testable import MUXSDKStatsGoogleIMAKaltura
import MUXSDKStatsKaltura
import MuxCore
import PlayKit

class MUXSDKImaKalturaListenerTests: XCTestCase {

    func testAdDispatchedEvents() {
        // Test setup
        guard let customerData = MockedData.customerData else {
            XCTFail("Customer data not found")
            return
        }
        
        let playerBinding = MUXSDKStats.monitorPlayer(
            player: MockedData.player,
            playerName: MockedData.playerName,
            customerData: customerData
        )
        
        let listener = MUXSDKImaKalturaListener(
            playerBinding: playerBinding,
            player: MockedData.player
        )
        
        // Dispatch AdEvents
        
        listener.dispatch(event: AdEvent.AdsRequested())
        listener.dispatch(event: AdEvent.AdDidRequestContentPause())
        listener.dispatch(event: AdEvent.AdDidRequestContentResume())
        listener.dispatch(event: AdEvent.AdLoaded())
        listener.dispatch(event: AdEvent.AdStarted())
        listener.dispatch(event: AdEvent.AdFirstQuartile())
        listener.dispatch(event: AdEvent.AdMidpoint())
        listener.dispatch(event: AdEvent.AdThirdQuartile())
        listener.dispatch(event: AdEvent.AdSkipped())
        listener.dispatch(event: AdEvent.AdComplete())
        listener.dispatch(event: AdEvent.AdPaused())
        listener.dispatch(event: AdEvent.AdResumed())
        listener.dispatch(event: AdEvent.Error())

        // Assert expected event types
        
        let expectedEvents = [
            MUXSDKPlaybackEventAdRequestEventType,
            MUXSDKPlaybackEventAdBreakStartEventType,
            MUXSDKPlaybackEventAdPlayEventType,
            MUXSDKPlaybackEventAdBreakEndEventType,
            MUXSDKPlaybackEventAdResponseEventType,
            MUXSDKPlaybackEventAdPlayingEventType,
            MUXSDKPlaybackEventAdFirstQuartileEventType,
            MUXSDKPlaybackEventAdMidpointEventType,
            MUXSDKPlaybackEventAdThirdQuartileEventType,
            MUXSDKPlaybackEventAdEndedEventType,
            MUXSDKPlaybackEventAdEndedEventType,
            MUXSDKPlaybackEventAdPauseEventType,
            MUXSDKPlaybackEventAdPlayEventType,
            MUXSDKPlaybackEventAdPlayingEventType,
            MUXSDKPlaybackEventAdErrorEventType
        ]
        
        self.assertDispatchedEventTypesMatch(expectedEventTypes: expectedEvents)
    }
    
}
