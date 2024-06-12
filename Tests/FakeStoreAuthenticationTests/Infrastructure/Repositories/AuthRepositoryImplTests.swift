//
//  AuthRepositoryImplTests.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import XCTest
@testable import FakeStoreAuthentication
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class AuthRepositoryImplTests: XCTestCase {
    
    private var sut: AuthRepositoryImpl!
    
    private var mockEnvironmentValuesProvider: MockEnvironmentValuesProviderProtocol!
    private var mockWebServiceProtocol: MockWebServiceRepositoryProtocol!
    
    private let injector = Injector.build(context: .tests(name: "AuthRepositoryImpl"))
    
    private var mockRequest: LoginRequest {
        LoginRequest(username: "", password: "")
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockEnvironmentValuesProvider = MockEnvironmentValuesProviderProtocol()
        mockWebServiceProtocol = MockWebServiceRepositoryProtocol()
        
        mockEnvironmentValuesProvider.result = "endpoint"
        
        injector.register(WebServiceRepositoryProtocol.self) { self.mockWebServiceProtocol }
        injector.register(EnvironmentValuesProviderProtocol.self) { self.mockEnvironmentValuesProvider }
        
        sut = AuthRepositoryImpl()
    }
    
    override func tearDownWithError() throws {
        mockEnvironmentValuesProvider = nil
        mockWebServiceProtocol = nil
        
        sut = nil
        injector.destroy()
        
        try super.tearDownWithError()
    }
    
    func testLoginSuccess() async throws {
        mockWebServiceProtocol.result = LoginResponse(token: "mock_token")
        
        let result = try await sut.login(mockRequest)
        
        XCTAssertNotNil(result.token)
    }
    
    
    func testLoginFail() async throws {
        mockWebServiceProtocol.error = CommonError.generic

        await XCTAssertThrowsErrorAsync(try await sut.login(mockRequest))
    }
}
