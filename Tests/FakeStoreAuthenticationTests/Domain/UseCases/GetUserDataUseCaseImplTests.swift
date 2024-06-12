//
//  GetUserDataUseCaseImplTests.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class GetUserDataUseCaseImplTests: XCTestCase {
    
    private var sut: GetUserDataUseCaseImpl!
    
    private var mockUserRepository: MockUserRepository!
    private var mockUserResponseToUserMapper: MockUserResponseToUserMapper!
    
    private let injector = Injector.build(context: .tests(name: "GetUserDataUseCaseImpl"))
    
    override func setUpWithError() throws {
        mockUserRepository = MockUserRepository()
        mockUserResponseToUserMapper = MockUserResponseToUserMapper()
        
        injector.register(UsersRepositoryProtocol.self) { self.mockUserRepository }
        injector.register(UserResponseToUserMapperProtocol.self) { self.mockUserResponseToUserMapper }
        
        sut = GetUserDataUseCaseImpl()
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        mockUserRepository = nil
        sut = nil
        
        injector.destroy()
        try super.tearDownWithError()
    }
    
    func testInvokeSuccess() async throws {
        let mockUsername = "mock_username"
        let mockToken = "mock_token"
            
        let mockResult = [
            UserResponse(id: 1, email: "", username: mockUsername, password: "", name: nil, address: nil, phone: "")
        ]
        
        let mockMapperResult = User(id: 1, email: "", username: mockUsername, firstName: "", lastName: "", phone: "", token: mockToken)
        
        mockUserRepository.result = .success(mockResult)
        mockUserResponseToUserMapper.result = mockMapperResult
        
        let result = try await sut.invoke(mockUsername, mockToken)
        
        XCTAssertEqual(result.username, mockUsername)
    }
    
    func testInvokeFailDueToUserNotFound() async throws {
        let mockUsername = "mock_username"
        let mockToken = "mock_token"
            
        mockUserRepository.result = .success([])
        
        await XCTAssertThrowsErrorAsync(try await sut.invoke(mockUsername, mockToken))
    }
}
