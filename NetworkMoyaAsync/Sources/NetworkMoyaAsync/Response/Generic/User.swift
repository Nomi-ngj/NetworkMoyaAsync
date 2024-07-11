//
//  User.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

// MARK: - Datum
public struct User: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?
}
