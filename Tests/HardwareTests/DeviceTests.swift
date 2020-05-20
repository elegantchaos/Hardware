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

        if let id = id {
            print("Device id is \(id).")
        }

    }
    
    func testSerialNumber() {
        #if canImport(IOKit)
        let device = Device.main
        let serial = device.serial
        XCTAssertNotNil(serial)
        if let serial = serial {
            print("Serial is \(serial).")
        }
        #endif
    }
    
    func testUser() {
        print("User is \(Device.main.user).")
        #if os(macOS)
        XCTAssertFalse(Device.main.user.isEmpty)
        #endif
    }
    
    func testSystem() {
        print("System is \(Device.main.system.name)")
        print("Version is \(Device.main.system.versionString)")
        print("Full Version is \(Device.main.system.fullVersionString)")
    }
    
    func testHostName() {
        print("Host name is \(Device.main.hostName)")
        XCTAssertFalse(Device.main.hostName.isEmpty)
    }
    
    func testIsSimulator() {
        #if targetEnvironment(simulator)
        XCTAssertTrue(Device.main.platform.isSimulator)
        #else
        XCTAssertFalse(Device.main.platform.isSimulator)
        #endif
    }
    
    func testIsCatalyst() {
        #if targetEnvironment(macCatalyst)
        XCTAssertTrue(Device.main.platform.isCatalyst)
        #else
        XCTAssertFalse(Device.main.platform.isCatalyst)
        #endif
    }
    
    func testIsAppKit() {
        #if os(macOS) && !targetEnvironment(macCatalyst)
        XCTAssertTrue(Device.main.platform.isAppKit)
        #else
        XCTAssertFalse(Device.main.platform.isAppKit)
        #endif
    }
    
    func testIsUIKit() {
        #if os(iOS) || os(tvOS) || (os(macOS) && targetEnvironment(macCatalyst))
        XCTAssertTrue(Device.main.platform.isUIKit)
        #else
        XCTAssertFalse(Device.main.platform.isUIKit)
        #endif
    }
}
