//
//  File.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockSaveUserUseCaseProtocol: SaveUserUseCaseProtocol {
    var error: Error?
    
    func invoke(_ user: User) async throws {
        guard let error else { return }
        
        throw error
    }
}
