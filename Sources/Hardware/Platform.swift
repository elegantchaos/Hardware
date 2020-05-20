// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 20/05/2020.
//  All code (c) 2020 - present day, Elegant Chaos Limited.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import Foundation

public struct Platform {
    public enum Base {
        case macOS
        case iOS
        case tvOS
        case watchOS
        case linux
        case other
    }
    
    public enum Variant {
        case normal
        case catalyst
        case simulator
    }

    public let base: Base
    public let variant: Variant
    
    public static var current: Platform {
        #if os(macOS)
            #if targetEnvironment(macCatalyst)
                return Platform(base: .macOS, variant: .catalyst)
            #else
                return Platform(base: .macOS, variant: .normal)
            #endif

        #elseif os(iOS)
            #if targetEnvironment(simulator)
                return Platform(base: .iOS, variant: .simulator)
            #else
                return Platform(base: .iOS, variant: .normal)
            #endif

        #elseif os(tvOS)
            #if targetEnvironment(simulator)
                return Platform(base: .tvOS, variant: .simulator)
            #else
                return Platform(base: .tvOS, variant: .normal)
            #endif

        #elseif os(watchOS)
            #if targetEnvironment(simulator)
                return Platform(base: .watchOS, variant: .simulator)
            #else
                return Platform(base: .watchOS, variant: .normal)
            #endif

        #elseif os(Linux)
            return Platform(base: .linux, variant: .normal)
        #else
            return Platform(base: .unknown, variant: .normal)
        #endif
    }
    
    public var isCatalyst: Bool { return variant == .catalyst }
    public var isAppKit: Bool { return base == .macOS && variant == .normal }
    public var isUIKit: Bool { return base == .iOS || base == .tvOS || isCatalyst }
    public var isSimulator: Bool { return variant == .simulator }
    public var isLinux: Bool { return base == .linux }
}
