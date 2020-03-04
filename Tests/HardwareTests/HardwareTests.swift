import XCTest
@testable import Hardware

final class HardwareTests: XCTestCase {
    func testDeviceIdentifier() {
        let device = Device()
        
        let id = device.identifier
        XCTAssertNotNil(id)
        XCTAssertEqual(id?.count, 17)
        XCTAssertEqual(id?.filter({ $0 == ":" }).count, 5)
    }
}
