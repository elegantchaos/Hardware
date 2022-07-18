// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 04/03/20.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

#if canImport(IOKit)
import IOKit

public class IOIterator<ObjectType> where ObjectType: IOObject {
    let iterator: IOObject?

    init(_ iterator: IOObject?) {
        self.iterator = iterator
    }

    func next() -> ObjectType? {
        if let iterator = iterator {
            return ObjectType(alreadyRetained: IOIteratorNext(iterator.object))
        } else {
            return nil
        }
    }

    func forEach(performBlock: (ObjectType) -> Void) {
        while let object = next() {
            performBlock(object)
        }
    }
}
#endif
