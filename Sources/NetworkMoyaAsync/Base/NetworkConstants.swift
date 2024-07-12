//
//  NetworkConstants.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation
import Alamofire

struct NetworkConstants {
    
    // MARK: - Constants
    
    /// Base URL for User API requests
    static let baseURL_User = URL(string: "https://reqres.in/api")!
    
    // MARK: - Methods
    
    /// Creates a server trust manager with the specified trust policy for multiple domains.
    /// - Parameter trustPolicy: The trust policy to apply to the specified domains.
    /// - Returns: A `ServerTrustManager` configured with the provided trust policy for multiple domains.
    static func evaluators(_ trustPolicy: PinnedCertificatesTrustEvaluator) -> ServerTrustManager {
        return ServerTrustManager(evaluators: [
            "reqres.in": trustPolicy,
            
            /// Example to add multiple domains:
            /*
             "abc.in": trustPolicy,
             "def.in": trustPolicy,
             "hij.in": trustPolicy,
             "klm.in": trustPolicy
             */
        ])
    }
}

