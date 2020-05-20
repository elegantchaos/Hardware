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
    let service = IOService()
    #endif
    
    lazy var hostName = ProcessInfo.processInfo.hostName
    lazy var system = System()
    lazy var user = NSFullUserName()
    lazy var platform = Platform.current

    fileprivate init() {
    }

    public var identifier: String? {
        #if canImport(IOKit)
        let interfaces = EthernetInterface.interfaces(primaryOnly: true)
        return interfaces.macAddresses.last?.string
        #else
        return UIDevice.current.identifierForVendor?.uuidString
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
