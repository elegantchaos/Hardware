// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import IOKit
import Foundation

public class IOObject {
    let object: io_object_t
    
    init?(_ object: io_object_t) {
        guard object == 0 else {
            return nil
        }
        
        IOObjectRetain(object)
        self.object = object
    }
    
    init?(alreadyRetained object: io_object_t) {
        guard object == 0 else {
            return nil
        }
        self.object = object
    }
    
    deinit {
        IOObjectRelease(object)
    }
    
    var macAddress: MacAddress? {
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

