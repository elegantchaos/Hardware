// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


import Foundation

#if canImport(UIKit)
import UIKit
#endif

extension OperatingSystemVersion {
    var asString: String {
        patchVersion == 0 ? "\(majorVersion).\(minorVersion)" : "\(majorVersion).\(minorVersion).\(patchVersion)"
    }
}

public struct System {
    public let name: String
    public let versionString: String
    public let fullVersionString: String
    public let version: OperatingSystemVersion
    public let platform: Platform

    init() {
        let info = ProcessInfo.processInfo
        version = info.operatingSystemVersion
        fullVersionString = info.operatingSystemVersionString
        platform = Platform.current

        #if canImport(UIKit)
        let device = UIDevice.current
        name = device.systemName
        versionString = device.systemVersion
        #else
        name = "Mac OS X"
        versionString = version.asString
        #endif
        
    }
}
