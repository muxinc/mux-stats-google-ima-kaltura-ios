//
//  PlayerViewController+IMAAds.swift
//  DemoApp
//
//  Created by Stephanie Zuñiga on 24/1/22.
//  Copyright © 2022 Mux, Inc. All rights reserved.
//

import PlayKit
import PlayKit_IMA

extension PlayerViewController {
    var adsPluginConfiguration: PluginConfig {
        let adsConfig = IMAConfig()
        adsConfig.set(
            adTagUrl: "https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/ad_rule_samples&ciu_szs=300x250&ad_rule=1&impl=s&gdfp_req=1&env=vp&output=vmap&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ar%3Dpremidpostlongpod&cmsid=496&vid=short_tencue&correlator="
        )
        
        let pluginConfig = PluginConfig(config: [IMAPlugin.pluginName: adsConfig])
        return pluginConfig
    }
}
