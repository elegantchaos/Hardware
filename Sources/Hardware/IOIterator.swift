// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import IOKit

public class IOIterator: IOObject {
    func next() -> IOObject? {
        return IOObject(alreadyRetained: IOIteratorNext(object))
    }
    
    func forEach(iterator: (IOObject) -> ()) {
        while let object = next() {
                iterator(object)
        }
    }
    
    var macAddresses: [MacAddress] {
        var results: [MacAddress] = []
        forEach(iterator: { interface in
            if let address = interface.macAddress {
                results.append(address)
            }
        })
        return results
    }
}
