//
//  MockUserRepository.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockUserRepository: UsersRepositoryProtocol {
    
    var result: Result<[UserResponse], Error>?
    
    func get() async throws -> [UserResponse] {
        guard let result else {
            throw CommonError.generic
        }
        
        switch result {
        case .success(let data):
            return data
        case .failure(let failure):
            throw failure
        }
    }
}
