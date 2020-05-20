// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

#if canImport(UIKit)
import UIKit
#endif

/// Abstraction of the hardware device we're running on.
/// (also incorporates some values from ProcessInfo.processInfo which don't vary per-process)
public struct Device {
    public static var main: Device = Device()

    #if canImport(IOKit)
    internal let service = IOService()
    #endif
    
    public lazy var hostName = ProcessInfo.processInfo.hostName
    public lazy var system = System()
    public lazy var user = NSFullUserName()

    fileprivate init() {
    }

    public var identifier: String? {
        #if canImport(IOKit)
        let interfaces = EthernetInterface.interfaces(primaryOnly: true)
        return interfaces.macAddresses.last?.string
        #elseif canImport(UIKit)
        return UIDevice.current.identifierForVendor?.uuidString
        #else
        return nil
        #endif
    }
    
    public var serial: String? {
        #if canImport(IOKit)
        return service.expertDevice?.string(forKey: "IOPlatformSerialNumber")
        #else
        return nil // TODO: implement this on iOS?
        #endif
    }
}
