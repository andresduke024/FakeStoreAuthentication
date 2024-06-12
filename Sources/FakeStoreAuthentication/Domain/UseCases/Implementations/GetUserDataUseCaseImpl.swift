//
//  GetUserDataUseCaseImpl.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct GetUserDataUseCaseImpl: GetUserDataUseCaseProtocol {
    
    @Inject
    private var usersRepository: UsersRepositoryProtocol
    
    @Inject
    private var userResponseToUserMapper: UserResponseToUserMapperProtocol
    
    func invoke(_ username: String, _ token: String) async throws -> User {
        let users = try await usersRepository.get()
        
        let user = users.first { $0.username?.lowercased() == username.lowercased() }
        
        guard let user else {
            throw CommonError.nilValue
        }
        
        return userResponseToUserMapper.map(user, token: token)
    }
}
