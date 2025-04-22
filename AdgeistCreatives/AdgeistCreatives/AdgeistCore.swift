//
//  AdgeistFunctionExpose.swift
//  AdgeistCreatives
//
//  Created by kishore on 16/04/25.
//

import Foundation

@objc public final class AdGeistCore:NSObject {
    @objc public static let shared = AdGeistCore()
    private init() {}
    
    private let deviceIdentifier = DeviceIdentifier()
    
    @objc public func getCreative() -> FetchCreative {
        return FetchCreative(deviceIdentifier: deviceIdentifier)
    }
    
    @objc public func postCreativeAnalytics() -> CreativeAnalytics {
        return CreativeAnalytics(deviceIdentifier: deviceIdentifier)
    }
}
