//
//  LoginUseCaseImpl.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct LoginUseCaseImpl: LoginUseCaseProtocol {
    
    @Inject
    private var repository: AuthRepositoryProtocol
    
    func invoke(_ request: LoginRequest) async throws -> String {
        let response = try await repository.login(request)
        
        guard let token = response.token else {
            throw CommonError.nilValue
        }
        
        return token
    }
}
