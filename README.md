[comment]: <> (Header Generated by ActionStatus 1.0.2 - 298)

[![Test results][tests shield]][actions] [![Latest release][release shield]][releases] [![swift 5.0 shield] ![swift 5.1 shield] ![swift 5.2 shield] ![swift 5.3 shield] ![swift dev shield]][swift] ![Platforms: macOS, iOS, tvOS, watchOS, Linux][platforms shield]

[release shield]: https://img.shields.io/github/v/release/elegantchaos/Hardware
[platforms shield]: https://img.shields.io/badge/platforms-macOS_iOS_tvOS_watchOS_Linux-lightgrey.svg?style=flat "macOS, iOS, tvOS, watchOS, Linux"
[tests shield]: https://github.com/elegantchaos/Hardware/workflows/Tests/badge.svg
[swift 5.0 shield]: https://img.shields.io/badge/swift-5.0-F05138.svg "Swift 5.0"
[swift 5.1 shield]: https://img.shields.io/badge/swift-5.1-F05138.svg "Swift 5.1"
[swift 5.2 shield]: https://img.shields.io/badge/swift-5.2-F05138.svg "Swift 5.2"
[swift 5.3 shield]: https://img.shields.io/badge/swift-5.3-F05138.svg "Swift 5.3"
[swift dev shield]: https://img.shields.io/badge/swift-dev-F05138.svg "Swift dev"

[swift]: https://swift.org
[releases]: https://github.com/elegantchaos/Hardware/releases
[actions]: https://github.com/elegantchaos/Hardware/actions

[comment]: <> (End of ActionStatus Header)

# Hardware

Some hardware related utilities.

You can use `Device.main` to interrogate various properties of the machine that you're running on.

In particular, you can obtain a unique identifier. This is based on the ethernet MAC address (on macOS), or the identifierForVendor value (on iOS).

Also contains some IOKit-related wrappers.
