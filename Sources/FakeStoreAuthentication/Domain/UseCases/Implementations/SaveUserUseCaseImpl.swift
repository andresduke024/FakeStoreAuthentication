//
//  SaveUserUseCaseImpl.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct SaveUserUseCaseImpl: SaveUserUseCaseProtocol {
    
    @Inject
    private var localStorageRepository: LocalStorageRepositoryProtocol
    
    func invoke(_ user: User) async throws {
        localStorageRepository.save(data: user, key: Constants.Keys.userKey)
    }
}
