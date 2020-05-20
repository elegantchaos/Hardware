import XCTest

import HardwareTests

var tests = [XCTestCaseEntry]()
tests += HardwareTests.__allTests()

XCTMain(tests)
