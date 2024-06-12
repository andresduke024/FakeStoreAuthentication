//
//  MockAuthRepository.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
@testable import FakeStoreAuthentication
@testable import FakeStoreCommons

final class MockAuthRepository: AuthRepositoryProtocol {
    var result: Result<LoginResponse, Error>?
    
    func login(_ request: LoginRequest) async throws -> LoginResponse {
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
