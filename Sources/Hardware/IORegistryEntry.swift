// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import IOKit

public class IORegistryEntry: IOObject {
    func string(forKey key: String) -> String? {
        let unmanagedString = IORegistryEntryCreateCFProperty(object, key as CFString, kCFAllocatorDefault, 0)
        return unmanagedString?.takeRetainedValue() as? String
    }
}
