//
//  MockedDispatcher.swift
//  Mux-Stats-Google-IMA-Kaltura
//
//  Created by Stephanie Zuñiga on 31/1/22.
//

import Foundation
import MuxCore

class MockedDispatcher: MUXSDKImaKalturaDispatcher {
    static let shared = MockedDispatcher()
    
    var dispatchedEvents = [MUXSDKPlaybackEvent]()
    
    func dispatch(_ event: MUXSDKPlaybackEvent) {
        print("dispatch ad event: \(event)")
        self.dispatchedEvents.append(event)
    }
}
