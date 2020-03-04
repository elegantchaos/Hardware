// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation


public struct Device {

    public var identifier: String? {
        guard let interfaces = ethernetInterfaces(primaryOnly: true) else { return nil }
        return interfaces.macAddresses.last?.string
    }

    func ethernetInterfaces(primaryOnly: Bool = false) -> IOIterator? {
        // see https://stackoverflow.com/questions/31835418/how-to-get-mac-address-from-os-x-with-swift
        let matcher = IOServiceMatching("IOEthernetInterface") as NSMutableDictionary
        if primaryOnly {
            matcher["IOPropertyMatch"] = [ "IOPrimaryInterface" : true]
        }

        var interfaces : io_iterator_t = 0
        if IOServiceGetMatchingServices(kIOMasterPortDefault, matcher, &interfaces) == KERN_SUCCESS {
            return IOIterator(alreadyRetained: interfaces)
        } else {
            return nil
        }
    }
    

}
