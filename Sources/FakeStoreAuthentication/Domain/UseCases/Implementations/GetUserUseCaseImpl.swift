//
//  GetUserUseCaseImpl.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct GetUserUseCaseImpl: GetUserUseCaseProtocol {
    
    @Inject
    private var localStorageRepository: LocalStorageRepositoryProtocol
    
    func invoke() async -> User? {
        return localStorageRepository.get(Constants.Keys.userKey)
    }
}
