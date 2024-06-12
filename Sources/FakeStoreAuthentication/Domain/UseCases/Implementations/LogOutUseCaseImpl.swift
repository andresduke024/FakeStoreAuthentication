//
//  LogOutUseCaseImpl.swift
//
//
//  Created by Andres Duque on 7/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

struct LogOutUseCaseImpl: LogOutUseCaseProtocol {
    
    @Inject
    private var localStorageRepository: LocalStorageRepositoryProtocol
    
    func invoke() async {
        localStorageRepository.remove(Constants.Keys.userKey)
    }
}
