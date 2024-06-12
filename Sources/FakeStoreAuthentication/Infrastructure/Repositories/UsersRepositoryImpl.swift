//
//  UsersRepositoryImpl.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct UsersRepositoryImpl: UsersRepositoryProtocol {
    @Injectable
    private var environmentValuesProvider: EnvironmentValuesProviderProtocol?
    
    @Injectable
    private var webService: WebServiceRepositoryProtocol?
    
    func get() async throws -> [UserResponse] {
        let baseUrl: String? = environmentValuesProvider?.get(.serviceURL)
        let url = (baseUrl ?? "") + Endpoints.users.value
        
        let response: [UserResponse]? = try await webService?.fetch(
            url: url,
            method: .get,
            body: nil
        )
        
        guard let response else {
            throw CommonError.nilValue
        }
        
        return response

    }
}
