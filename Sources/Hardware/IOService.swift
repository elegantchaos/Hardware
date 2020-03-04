// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import IOKit

public class IOService {
    let port = kIOMasterPortDefault
    
    var expertDevice: IORegistryEntry? {
        return IORegistryEntry(alreadyRetained: IOServiceGetMatchingService(port, IOServiceMatching("IOPlatformExpertDevice")))
    }
}
