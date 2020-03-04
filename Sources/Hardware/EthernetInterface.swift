// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

#if canImport(IOKit)
import IOKit

public class EthernetInterface: IOObject {
    class func interfaces(primaryOnly: Bool = false) -> EthernetInterfaceIterator {
        // see https://stackoverflow.com/questions/31835418/how-to-get-mac-address-from-os-x-with-swift
        let matcher = IOServiceMatching("IOEthernetInterface") as NSMutableDictionary
        if primaryOnly {
            matcher["IOPropertyMatch"] = [ "IOPrimaryInterface" : true]
        }

        var interfaces : io_iterator_t = 0
        if IOServiceGetMatchingServices(kIOMasterPortDefault, matcher, &interfaces) != KERN_SUCCESS {
        }
        
        return EthernetInterfaceIterator(IOObject(alreadyRetained: interfaces))
    }

    public var macAddress: MacAddress? {
        var service : io_object_t = 0
        if IORegistryEntryGetParentEntry(object, "IOService", &service) == KERN_SUCCESS {
            defer { IOObjectRelease(service) }
            let unmanagedData = IORegistryEntryCreateCFProperty(service, "IOMACAddress" as CFString, kCFAllocatorDefault, 0)
            if let data = unmanagedData?.takeRetainedValue() as? Data {
                return MacAddress(raw: data)
            }
        }
        
        return nil
    }
}

public class EthernetInterfaceIterator: IOIterator<EthernetInterface> {
    var macAddresses: [MacAddress] {
        var results: [MacAddress] = []
        forEach() { interface in
            if let address = interface.macAddress {
                results.append(address)
            }
        }
        return results
    }
}
#endif
