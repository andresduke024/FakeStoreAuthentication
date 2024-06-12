//
//  Endpoints.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation

public enum Endpoints {
    case login
    case users
    
    var value: String {
        switch self {
        case .login:
            "/auth/login"
        case .users:
            "/users"
        }
    }
}
