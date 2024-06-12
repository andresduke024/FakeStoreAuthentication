//
//  LoginRequest.swift
//
//
//  Created by Andres Duque on 29/05/24.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
    
    init(
        username: String,
        password: String
    ) {
        self.username = username
        self.password = password
    }
}
