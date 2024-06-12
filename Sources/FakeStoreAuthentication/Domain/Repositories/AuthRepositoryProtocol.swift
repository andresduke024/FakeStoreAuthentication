//
//  AuthRepositoryProtocol.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import SwiftDependencyInjector

protocol AuthRepositoryProtocol: InjectableDependency {
    func login(_ request: LoginRequest) async throws -> LoginResponse
}
