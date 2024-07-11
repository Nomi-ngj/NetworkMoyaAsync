//
//  NetworkError.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

enum NetworkError: Error {
    // Enumerates network error cases
    case genericError(code: Int, message: String? = "")
    case parsingError
    
    // Provides localized descriptions for each network error case
    var localizedDescription: String {
        
        switch self {
        case .genericError(_, let message):
            return message ?? ""
        case .parsingError:
            return NSLocalizedString("Error while parsing data.", comment: "")
        }
    }
    
    // Initializes NetworkError from another Error
    init(_ error: Error) {
        if let networkError = error as? NetworkError {
            self = networkError
        } else {
            self = .genericError(code: 0, message: error.localizedDescription)
        }
    }
}

extension Error {
    // Provides a localized description for network errors or returns the standard error description
    var localizedNetworkErrorDescription: String {
        guard let networkError = self as? NetworkError else {
            return self.localizedDescription
        }
        return networkError.localizedDescription
    }
}

