//
//  MoyaProvider.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Moya
import Foundation

extension MoyaProvider {
    
    // MARK: - MoyaConcurrency
    
    /// Helper class to provide asynchronous request capabilities using Moya with async/await.
    class MoyaConcurrency {
        
        private let provider: MoyaProvider
        
        /// Initializes a new instance of MoyaConcurrency with the given MoyaProvider.
        /// - Parameter provider: The MoyaProvider instance to use for network requests.
        init(provider: MoyaProvider) {
            self.provider = provider
        }
        
        /// Performs an asynchronous network request and decodes the response into a specified type.
        /// - Parameter target: The Moya Target representing the endpoint to request.
        /// - Returns: A value of type T decoded from the network response.
        /// - Throws: An error if the network request fails or if there's an issue decoding the response.
        func request<T: Decodable>(_ target: Target) async throws -> T {
            return try await withCheckedThrowingContinuation { continuation in
                
                provider.request(target) { result in
                    switch result {
                    case .success(let response):
                        // Attempt to decode the response into the specified type T
                        guard let res = try? JSONDecoder.default.decode(T.self, from: response.data) else {
                            continuation.resume(throwing: NetworkError.parsingError)
                            return
                        }
                        // Resume with the decoded result
                        continuation.resume(returning: res)
                        
                    case .failure(let error):
                        // Resume with the encountered error
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    /// Provides access to asynchronous request capabilities using Moya with async/await.
    var async: MoyaConcurrency {
        MoyaConcurrency(provider: self)
    }
}
