//
//  Plugin.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation
import Moya

struct Plugin {
    
    // Initializes the plugin
    init() {}
    
    // Plugin for managing network activity
    static let networkPlugin = NetworkActivityPlugin(networkActivityClosure: { (changeType, _) in
        switch changeType {
        case .began:
            debugPrint("Shows activity indicator when network activity begins")
        case .ended:
            debugPrint("Hides activity indicator when network activity ends")
        }
    })

    // Plugin for logging network requests and responses
    #if DEBUG
    static var loggerPluggin = NetworkLoggerPlugin.verbose
    #else
    static var loggerPluggin = NetworkLoggerPlugin.default
    #endif
    
    // Plugin for handling status code responses
    static let statusCodePlugin = StatusCodePlugin()
}

class StatusCodePlugin: PluginType {
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        // Processes the result based on success or failure
        switch result {
        case .success(_):
            return result
        case .failure(_):
            return result
        }
    }
}
