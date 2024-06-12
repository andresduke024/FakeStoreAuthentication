//
//  UserResponse.swift
//
//
//  Created by Andres Duque on 6/06/24.
//

import Foundation

// MARK: - User
struct UserResponse: Codable {
    let id: Int?
    let email: String?
    let username: String?
    let password: String?
    let name: NameResponse?
    let address: AddressResponse?
    let phone: String?
}
