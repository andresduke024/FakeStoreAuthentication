//
//  UserResponseToUserMapperImpl.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation
import FakeStoreCommons

struct UserResponseToUserMapperImpl: UserResponseToUserMapperProtocol {
    func map(_ data: UserResponse, token: String) -> User {
        User(
            id: data.id ?? 0,
            email: data.email ?? "",
            username: data.username ?? "",
            firstName: data.name?.firstname ?? "",
            lastName: data.name?.lastname ?? "",
            phone: data.phone ?? "",
            token: token
        )
    }
}
