import XCTest
@testable import Hardware

final class HardwareTests: XCTestCase {
    func testDeviceIdentifier() {
        let device = Device.main
        
        let id = device.identifier
        XCTAssertNotNil(id)
        
        #if canImport(IOKit)
        XCTAssertEqual(id?.count, 17) // should be a 17-char MAC address
        XCTAssertEqual(id?.filter({ $0 == ":" }).count, 5)
        #else
        XCTAssertEqual(id?.count, 36) // should be a 36-char UUID
        #endif
    }
    
    func testSerialNumber() {
        #if canImport(IOKit)
        let device = Device.main
        let serial = device.serial
        XCTAssertNotNil(serial)
        #endif
    }
}
