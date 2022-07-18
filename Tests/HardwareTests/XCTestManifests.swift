#if !canImport(ObjectiveC)
import XCTest

extension HardwareTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__HardwareTests = [
        ("testDeviceIdentifier", testDeviceIdentifier),
        ("testHostName", testHostName),
        ("testIsAppKit", testIsAppKit),
        ("testIsCatalyst", testIsCatalyst),
        ("testIsSimulator", testIsSimulator),
        ("testIsUIKit", testIsUIKit),
        ("testSerialNumber", testSerialNumber),
        ("testSystem", testSystem),
        ("testUser", testUser),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    [
        testCase(HardwareTests.__allTests__HardwareTests),
    ]
}
#endif
