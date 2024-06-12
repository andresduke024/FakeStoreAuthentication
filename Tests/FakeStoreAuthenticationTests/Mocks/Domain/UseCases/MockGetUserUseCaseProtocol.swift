//
//  File.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockGetUserUseCaseProtocol: GetUserUseCaseProtocol {
    var result: User?
    
    func invoke() async -> User? { result }
}
