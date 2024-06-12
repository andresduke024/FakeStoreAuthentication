//
//  MockLoginUseCaseProtocol.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
@testable import FakeStoreAuthentication
@testable import FakeStoreCommons

final class MockLoginUseCaseProtocol: LoginUseCaseProtocol {

    var result: Result<LoginResponse, any Error>?
    
    func invoke(_ request: LoginRequest) async throws -> String {
        guard let result else {
            throw CommonError.generic
        }
        
        switch result {
        case .success(let data):
            return data.token!
        case .failure(let failure):
            throw failure
        }
    }
}
