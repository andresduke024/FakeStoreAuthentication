//
//  MockGetUserDataUseCaseProtocol.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockGetUserDataUseCaseProtocol: GetUserDataUseCaseProtocol {
    
    var result: Result<User, Error>?
    
    func invoke(_ username: String, _ token: String) async throws -> User {
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
