//
//  FetchCreative.swift
//  AdgeistCreatives
//
//  Created by kishore on 16/04/25.
//

import Foundation

@objc public class FetchCreative: NSObject {
    private let deviceIdentifier: DeviceIdentifier
    
    @objc init(deviceIdentifier: DeviceIdentifier) {
        self.deviceIdentifier = deviceIdentifier
    }
    
    @objc public func fetchCreative(adSpaceId: String, publisherId: String, completion: @escaping (CreativeDataModel?) -> Void) {
        deviceIdentifier.getDeviceIdentifier { deviceId in
            print("\(deviceId)----------------------------")
            
            let urlString = "https://beta-api.adgeist.ai/campaign/dummy?adSpaceId=\(adSpaceId)&companyId=\(publisherId)"
            guard let url = URL(string: urlString) else {
                completion(nil)
                return
            }
            
            var request = URLRequest(url: url)
            request.addValue("https://beta.adgeist.ai", forHTTPHeaderField: "Origin")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Failed to fetch ad data: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                do {
                    let creativeData = try JSONDecoder().decode(CreativeDataModel.self, from: data)
                    print("\(creativeData)")
                    completion(creativeData)
                } catch {
                    print("Failed to parse creative data: \(error.localizedDescription)")
                    completion(nil)
                }
            }
            
            task.resume()
        }
    }
}
