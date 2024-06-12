//
//  UserResponseToUserMapperImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreAuthentication

final class UserResponseToUserMapperImplTests: XCTestCase {
    
    private var sut: UserResponseToUserMapperImpl!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = UserResponseToUserMapperImpl()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        sut = nil
    }

    func testMap() throws {
        let mockId = 0
        let mockEmail = "mock_email"
        let mockUsername = "mock_username"
        let mockFirstName = "mock_first_name"
        let mockLastName = "mock_last_name"
        let mockPhone = "1234"
        let mockToken = "mock_token"
        
        let mockUserResponse = UserResponse(
            id: mockId,
            email: mockEmail,
            username: mockUsername,
            password: "",
            name: NameResponse(
                firstname: mockFirstName,
                lastname: mockLastName
            ),
            address: nil,
            phone: mockPhone
        )
        
        let result = sut.map(mockUserResponse, token: mockToken)
        
        XCTAssertEqual(result.id, mockId)
        XCTAssertEqual(result.email, mockEmail)
        XCTAssertEqual(result.username, mockUsername)
        XCTAssertEqual(result.firstName, mockFirstName)
        XCTAssertEqual(result.lastName, mockLastName)
        XCTAssertEqual(result.phone, mockPhone)
        XCTAssertEqual(result.token, mockToken)
    }
    
    func testMapWithNilValues() throws {
        let mockToken = "mock_token"
        
        let mockUserResponse = UserResponse(
            id: nil,
            email: nil,
            username: nil,
            password: "",
            name: nil,
            address: nil,
            phone: nil
        )
        
        let result = sut.map(mockUserResponse, token: mockToken)
        
        XCTAssertEqual(result.id, 0)
        XCTAssertEqual(result.email, "")
        XCTAssertEqual(result.username, "")
        XCTAssertEqual(result.firstName, "")
        XCTAssertEqual(result.lastName, "")
        XCTAssertEqual(result.phone, "")
        XCTAssertEqual(result.token, mockToken)
    }
}
