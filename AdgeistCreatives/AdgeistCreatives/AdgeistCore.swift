//
//  AdgeistFunctionExpose.swift
//  AdgeistCreatives
//
//  Created by kishore on 16/04/25.
//

import Foundation

public final class AdGeistCore {
    public static let shared = AdGeistCore()
    private init() {}
    
    private let deviceIdentifier = DeviceIdentifier()
    
    public func getCreative() -> FetchCreative {
        return FetchCreative(deviceIdentifier: deviceIdentifier)
    }
    
    public func postCreativeAnalytics() -> CreativeAnalytics {
        return CreativeAnalytics(deviceIdentifier: deviceIdentifier)
    }
}
