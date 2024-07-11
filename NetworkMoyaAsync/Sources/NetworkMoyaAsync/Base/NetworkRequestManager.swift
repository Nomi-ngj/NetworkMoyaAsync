//
//  NetworkRequestManager.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation
import Alamofire

enum TimeOutInterval: TimeInterval {
    // Enumerates timeout intervals for network requests
    case `default` = 20
    case longTime = 60
}

class NetworkRequestManager {
    
    // Creates a server trust manager for SSL certificate validation
    static private func createServerTrustManager() -> ServerTrustManager {
        // Provide your SSL certificate name here
        let cert = "ssl_certificate"
        
        // Attempt to find and load the SSL certificate from the main bundle
        guard let certUrl = Bundle.main.url(forResource: cert, withExtension: "cer"),
              let certData = try? Data(contentsOf: certUrl) else {
            // If certificate file is not found, terminate the application
            fatalError("Certificate file not found")
        }
        
        // Create a trust policy using the loaded certificate data
        let trustPolicy = PinnedCertificatesTrustEvaluator(
            certificates: [SecCertificateCreateWithData(nil, certData as CFData)!],
            acceptSelfSignedCertificates: true,
            performDefaultValidation: true,
            validateHost: true
        )
        
        // Return a server trust manager configured with the trust policy
        return NetworkConstants.evaluators(trustPolicy)
    }

    
    // Creates and returns a session manager with specified timeout interval
    static func manager(_ timeoutInterval: TimeOutInterval = TimeOutInterval.default) -> Alamofire.Session {
        let configuration = URLSessionConfiguration.default
        
        configuration.timeoutIntervalForRequest = timeoutInterval.rawValue
        
//        Uses a custom server trust manager in production
//        let serverTrustManager = self.createServerTrustManager()
//        let manager = Alamofire.Session(configuration: configuration, serverTrustManager: serverTrustManager)
    
//        Uses default session manager in non-production environments
        let manager = Alamofire.Session(configuration: configuration)
        
        return manager
    }
}
