//
//  Dispatcher.swift
//  Mux-Stats-Google-IMA-Kaltura
//
//  Created by Stephanie Zuñiga on 31/1/22.
//

import Foundation
import MuxCore

protocol MUXSDKImaKalturaDispatcher {
    func dispatch(_ event: MUXSDKPlaybackEvent)
}
