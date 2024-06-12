//
//  MockUserResponseToUserMapper.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockUserResponseToUserMapper: UserResponseToUserMapperProtocol {
    
    var result: User?
    
    func map(_ data: UserResponse, token: String) -> User {
        return result ?? User(id: 0, email: "", username: "", firstName: "", lastName: "", phone: "", token: "")
    }
}
