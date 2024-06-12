//
//  LoginUseCaseProtocol.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation
import SwiftDependencyInjector

protocol LoginUseCaseProtocol: InjectableDependency {
    func invoke(_ request: LoginRequest) async throws -> String
}
