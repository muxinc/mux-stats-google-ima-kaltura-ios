//
//  MockedData.swift
//  MUXSDKStatsKalturaTests
//
//  Created by Stephanie Zuñiga on 9/11/21.
//  Copyright © 2021 Mux, Inc. All rights reserved.
//

import Foundation
import MuxCore
import PlayKit
import PlayKit_IMA
import MUXSDKStatsKaltura
@testable import MUXSDKStatsGoogleIMAKaltura

enum MockedData {
    static let playerName = "Test Player"
    
    static var customerData: MUXSDKCustomerData? {
        let playerName = Self.playerName
        
        let playerData = MUXSDKCustomerPlayerData(environmentKey: "ENV_KEY")
        playerData?.playerName = playerName
        
        let videoData = MUXSDKCustomerVideoData()
        videoData.videoTitle = "Video Title"
        videoData.videoId = "videoId"
        videoData.videoSeries = "series"
        
        let viewData = MUXSDKCustomerViewData()
        viewData.viewSessionId = "session id"
        
        let customData = MUXSDKCustomData()
        customData.customData1 = "Custom Data 1"
        customData.customData2 = "Custom Data 2"
        
        let viewerData = MUXSDKCustomerViewerData()
        viewerData.viewerApplicationName = "MUX Kaltura Tests"
        
        return MUXSDKCustomerData(
            customerPlayerData: playerData,
            videoData: videoData,
            viewData: viewData,
            customData: customData,
            viewerData: viewerData
        )
    }
    
    static var adsPluginConfiguration: PluginConfig {
        let adsConfig = IMAConfig()
        adsConfig.set(
            adTagUrl: "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostlongpod&cmsid=496&vid=short_tencue&correlator="
        )
        
        let pluginConfig = PluginConfig(config: [IMAPlugin.pluginName: adsConfig])
        return pluginConfig
    }
    
    static let player = PlayKitManager.shared.loadPlayer(pluginConfig: adsPluginConfiguration)
}
