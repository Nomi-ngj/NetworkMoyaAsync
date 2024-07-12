//
//  UserRequest.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation

public struct UserRequest:Encodable{
    let page: Int
    
    public init(page: Int) {
        self.page = page
    }
}
