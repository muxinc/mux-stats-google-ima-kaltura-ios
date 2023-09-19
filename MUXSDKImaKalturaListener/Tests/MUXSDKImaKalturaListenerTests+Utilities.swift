//
//  MUXSDKImaKalturaListenerTests+Utilities.swift
//  Mux-Stats-Google-IMA-Kaltura
//
//  Created by Stephanie Zuñiga on 3/02/22.
//  Copyright © 2022 Mux, Inc. All rights reserved.
//

import XCTest
@testable import MUXSDKStatsGoogleIMAKaltura
import MuxCore

extension MUXSDKImaKalturaListenerTests {
    func assertDispatchedEventTypesMatch(expectedEventTypes: [String]) {
        let dispatchedEventsType = MockedDispatcher.shared.dispatchedEvents
            .map { $0.getType() }
        
        XCTAssertEqual(expectedEventTypes, dispatchedEventsType)
    }
}
