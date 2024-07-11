//
//  UserClient.swift
//
//
//  Created by Nouman Gul Junejo on 12/07/2024.
//

import Foundation
import Moya

public class UserClient{
    
    public init(){}
    
    /// MoyaProvider for handling UserService requests with regular session configuration.
    private let provider = MoyaProvider<UserService>(session: NetworkRequestManager.manager(.default),
                                                               plugins: [Plugin.loggerPluggin, Plugin.networkPlugin, Plugin.statusCodePlugin])
    
    /// MoyaProvider for handling UserService requests with background session configuration.
    private let backgroundProvider = MoyaProvider<UserService>(session: NetworkRequestManager.manager(.longTime),
                                                                         plugins: [Plugin.loggerPluggin, Plugin.statusCodePlugin])


    public func getUsers(request:UserRequest) async throws -> Pagination<User>  {
        return try await provider.async.request(.user(request: request))
    }
}
