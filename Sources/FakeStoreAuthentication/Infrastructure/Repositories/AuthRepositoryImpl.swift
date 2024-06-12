//
//  AuthRepositoryImpl.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct AuthRepositoryImpl: AuthRepositoryProtocol {
    
    @Injectable
    private var environmentValuesProvider: EnvironmentValuesProviderProtocol?
    
    @Injectable
    private var webService: WebServiceRepositoryProtocol?
    
    func login(_ request: LoginRequest) async throws -> LoginResponse {
        let baseUrl: String? = environmentValuesProvider?.get(.serviceURL)
        let url = (baseUrl ?? "") + Endpoints.login.value
        
        let response: LoginResponse? = try await webService?.fetch(
            url: url,
            method: .post,
            body: request
        )
        
        guard let response else {
            throw CommonError.nilValue
        }
        
        return response
    }
}
