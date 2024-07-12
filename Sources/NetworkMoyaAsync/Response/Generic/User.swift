//
//  User.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

// MARK: - User
public struct User: Decodable, Identifiable, Equatable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let email: String
    public let avatar: String
    
    public init(id: Int, firstName: String, lastName: String, email: String, avatar: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.avatar = avatar
    }
    
    public func contains(query:String) -> Bool{
        return firstName.lowercased().contains(query.lowercased()) || lastName.lowercased().contains(query.lowercased()) || email.lowercased().contains(query.lowercased())
           
    }
}
