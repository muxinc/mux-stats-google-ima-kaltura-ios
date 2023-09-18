//
//  TimeInterval+Format.swift
//  DemoApp
//
//  Created by Stephanie Zuñiga on 26/1/22.
//

import Foundation

extension TimeInterval {
    var formattedTimeDisplay: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        if let timeDisplay = formatter.string(from: self) {
            return timeDisplay.count > 4 ? timeDisplay : "0" + timeDisplay
        } else {
            return "00:00"
        }
    }
}

