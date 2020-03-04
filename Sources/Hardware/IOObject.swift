// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import IOKit
import Foundation

public class IOObject {
    let object: io_object_t
    
    required init?(_ object: io_object_t) {
        guard object != 0 else { return nil }
        IOObjectRetain(object)
        self.object = object
    }
    
    required init?(alreadyRetained object: io_object_t) {
        guard object != 0 else { return nil }
        self.object = object
    }
    
    deinit {
        IOObjectRelease(object)
    }
}
