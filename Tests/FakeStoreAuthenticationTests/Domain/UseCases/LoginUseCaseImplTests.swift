//
//  LoginUseCaseImplTests.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import XCTest
@testable import FakeStoreAuthentication
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class LoginUseCaseImplTests: XCTestCase {
    
    private var sut: LoginUseCaseImpl!
    
    private var mockAuthRepository: MockAuthRepository!
    
    private let injector = Injector.build(context: .tests(name: "LoginUseCaseImpl"))
    
    private var mockRequest: LoginRequest {
        LoginRequest(username: "", password: "")
    }
    
    override func setUpWithError() throws {
        mockAuthRepository = MockAuthRepository()
        
        injector.register(AuthRepositoryProtocol.self) { self.mockAuthRepository }
        
        sut = LoginUseCaseImpl()
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        mockAuthRepository = nil
        sut = nil
        
        injector.destroy()
        try super.tearDownWithError()
    }
    
    func testInvokeSuccess() async throws {
        mockAuthRepository.result = .success(LoginResponse(token: "mock_token"))
        
        let result = try await sut.invoke(mockRequest)
        
        XCTAssert(!result.isEmpty)
    }
    
    func testInvokeFailure() async throws {
        mockAuthRepository.result = .failure(CommonError.generic)
        
        await XCTAssertThrowsErrorAsync(try await sut.invoke(mockRequest))
    }
    
    func testInvokeFailureDueToMissingToken() async throws {
        mockAuthRepository.result = .success(LoginResponse(token: nil))
        
        await XCTAssertThrowsErrorAsync(try await sut.invoke(mockRequest))
    }
}
