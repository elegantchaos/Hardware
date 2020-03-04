// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public struct Device {
    public static var main: Device = Device()

    let service = IOService()
    
    fileprivate init() {
    }
    
    public var identifier: String? {
        let interfaces = EthernetInterface.interfaces(primaryOnly: true)
        return interfaces.macAddresses.last?.string
    }
    
    public var serial: String? {
        return service.expertDevice?.string(forKey: "IOPlatformSerialNumber")
    }
}
