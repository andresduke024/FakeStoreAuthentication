//
//  GetAuthenticationStateUseCaseImpl.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct GetAuthenticationStateUseCaseImpl: GetAuthenticationStateUseCaseProtocol {
    
    @Inject
    private var getUserUseCase: GetUserUseCaseProtocol
    
    func invoke() async -> AuthenticationState {
        guard let user = await getUserUseCase.invoke() else {
            return .unauthenticated
        }
        
        if user.token.isEmpty {
            return .unauthenticated
        }
        
        return .authenticated
    }
}

