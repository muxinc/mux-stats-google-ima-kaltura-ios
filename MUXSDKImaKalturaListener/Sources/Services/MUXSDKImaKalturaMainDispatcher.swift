//
//  MainDispatcher.swift
//  Mux-Stats-Google-IMA-Kaltura
//
//  Created by Stephanie Zuñiga on 31/1/22.
//

import Foundation
import MUXSDKStatsKaltura
import MuxCore

class MUXSDKImaKalturaMainDispatcher: MUXSDKImaKalturaDispatcher {
    private let playerBinding: MUXSDKPlayerBinding
    
    init(playerBinding: MUXSDKPlayerBinding) {
        self.playerBinding = playerBinding
    }
    
    func dispatch(_ event: MUXSDKPlaybackEvent) {
        self.playerBinding.dispatch(event: event)
    }
}

