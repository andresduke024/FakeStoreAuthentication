//
//  UserResponseToUserMapperProtocol.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons
import SwiftDependencyInjector

protocol UserResponseToUserMapperProtocol: InjectableDependency {
    func map(_ data: UserResponse, token: String) -> User
}
