//
//  GetUserDataUseCaseProtocol.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

protocol GetUserDataUseCaseProtocol: InjectableDependency {
    func invoke(_ username: String, _ token: String) async throws -> User
}
