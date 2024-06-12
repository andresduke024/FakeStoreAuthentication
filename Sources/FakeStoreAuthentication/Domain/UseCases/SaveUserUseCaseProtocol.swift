//
//  SaveUserUseCaseProtocol.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

public protocol SaveUserUseCaseProtocol: InjectableDependency {
    func invoke(_ user: User) async throws
}
