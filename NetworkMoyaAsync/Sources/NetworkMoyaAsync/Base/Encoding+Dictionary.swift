//
//  Encoding+Dictionary.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

extension Encodable {
    /// Converts an encodable object into a dictionary.
    ///
    /// - Returns: A dictionary representation of the encodable object.
    func toDictionary() -> [String: Any] {
        let encoder = JSONEncoder()
        
        // Customize the encoding strategy if needed
//        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        guard let data = try? encoder.encode(self) else {
            return [:]
        }
        
        if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            return dictionary
        }
        
        return [:]
    }
}

extension JSONDecoder {
    /// Default JSONDecoder with key decoding strategy set to convert from snake case.
    static var `default`: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

