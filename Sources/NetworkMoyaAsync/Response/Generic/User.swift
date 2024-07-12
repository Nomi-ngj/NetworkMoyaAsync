//
//  User.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

// MARK: - Datum
public struct User: Codable {
    public let id: Int
    public let email, firstName, lastName: String
    public let avatar: String
}
