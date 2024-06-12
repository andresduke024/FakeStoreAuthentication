//
//  MockLocalStorageRepository.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockLocalStorageRepository: LocalStorageRepositoryProtocol {
    
    var saveWasCalled: Bool = false
    func save<T>(data: T, key: String) where T : Encodable {
        saveWasCalled = true
    }
    
    var getWasCalled: Bool = false
    func get<T>(_ key: String) -> T? where T : Decodable {
        getWasCalled = true
        return nil
    }
    
    var removeWasCalled: Bool = false
    func remove(_ key: String) {
        removeWasCalled = true
    }
}
