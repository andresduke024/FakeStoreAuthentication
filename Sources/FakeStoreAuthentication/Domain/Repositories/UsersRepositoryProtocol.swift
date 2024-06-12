//
//  UsersRepositoryProtocol.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import SwiftDependencyInjector

protocol UsersRepositoryProtocol: InjectableDependency {
    func get() async throws -> [UserResponse]
}
