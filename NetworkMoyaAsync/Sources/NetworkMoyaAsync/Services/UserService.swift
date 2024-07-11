//
//  UserService.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation
import Moya

enum UserService{
    case user
}

extension UserService:TargetType{
    var baseURL: URL {
        return NetworkConstants.baseURL_User
    }
    
    var path: String {
        switch self {
        case .user:
            return "/users?page=1"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .user:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .user:
            return .requestParameters(parameters: ["page":1], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
