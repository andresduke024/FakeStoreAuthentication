//
//  UsersRepositoryImplTests.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreAuthentication
@testable import FakeStoreCommons
@testable import SwiftDependencyInjector

final class UsersRepositoryImplTests: XCTestCase {
    
    private var sut: UsersRepositoryImpl!
    
    private var mockEnvironmentValuesProvider: MockEnvironmentValuesProviderProtocol!
    private var mockWebServiceProtocol: MockWebServiceRepositoryProtocol!
    
    private let injector = Injector.build(context: .tests(name: "UsersRepositoryImpl"))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockEnvironmentValuesProvider = MockEnvironmentValuesProviderProtocol()
        mockWebServiceProtocol = MockWebServiceRepositoryProtocol()
        
        mockEnvironmentValuesProvider.result = "endpoint"
        
        injector.register(WebServiceRepositoryProtocol.self) { self.mockWebServiceProtocol }
        injector.register(EnvironmentValuesProviderProtocol.self) { self.mockEnvironmentValuesProvider }
        
        sut = UsersRepositoryImpl()
    }
    
    override func tearDownWithError() throws {
        mockEnvironmentValuesProvider = nil
        mockWebServiceProtocol = nil
        
        sut = nil
        injector.destroy()
        
        try super.tearDownWithError()
    }
    
    func testLoginSuccess() async throws {
        mockWebServiceProtocol.result = [
            UserResponse(id: 0, email: "", username: "", password: "", name: nil, address: nil, phone: "")
        ]
        
        let result = try await sut.get()
        
        XCTAssertEqual(result.count, 1)
    }
    
    
    func testLoginFail() async throws {
        mockWebServiceProtocol.error = CommonError.generic

        await XCTAssertThrowsErrorAsync(try await sut.get())
    }
}
