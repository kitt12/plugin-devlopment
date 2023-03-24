//
//  PluginList.swift
//  Plugin Development
//
//  Created by Theara Kit on 9/3/23.
//

import Foundation

let pluginList: [Plugin] = [
    Plugin(id: 1, title: "Sample", screen: SampleUIViewController()),
    Plugin(id: 2, title: "Quiz", screen: Quiz()),
    Plugin(id: 3, title: "Mp3", screen: Mp3Plugin()),
    Plugin(id: 4, title: "QRScanner", screen: QRScanner()),
    Plugin(id: 5, title: "Average", screen: Average()),
    Plugin(id: 6, title: "Sample View", screen: SampleViewController())
]
