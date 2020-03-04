import XCTest
@testable import Hardware

final class HardwareTests: XCTestCase {
    func testDeviceIdentifier() {
        let device = Device.main
        
        let id = device.identifier
        XCTAssertNotNil(id)
        XCTAssertEqual(id?.count, 17)
        XCTAssertEqual(id?.filter({ $0 == ":" }).count, 5)
    }
    
    func testSerialNumber() {
        let device = Device.main
        let serial = device.serial
        XCTAssertNotNil(serial)
    }
}
