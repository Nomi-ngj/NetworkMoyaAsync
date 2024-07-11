//
//  UserService.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation
import Moya

enum UserService{
    case user(request:UserRequest)
}

extension UserService:TargetType{
    var baseURL: URL {
        return NetworkConstants.baseURL_User
    }
    
    var path: String {
        switch self {
        case .user:
            return "/users"
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
        case .user(let request):
            return .requestParameters(parameters: request.toDictionary(), encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
