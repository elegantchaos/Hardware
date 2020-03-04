# Hardware

Some hardware related utilities.

You can use `Device.main` to interrogate various properties of the machine that you're running on.

In particular, you can obtain a unique identifier. This is based on the ethernet MAC address (on macOS), or the identifierForVendor value (on iOS).

Also contains some IOKit-related wrappers.
