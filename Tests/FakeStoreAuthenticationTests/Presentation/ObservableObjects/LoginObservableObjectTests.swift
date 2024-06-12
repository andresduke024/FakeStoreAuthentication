//
//  LoginObservableObjectTests.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class LoginObservableObjectTests: XCTestCase {
    
    private var sut: LoginObservableObject!
    
    private var mockRouterEventPool: MockRouterEventPool!
    private var mockLoginUseCase: MockLoginUseCaseProtocol!
    private var mockGetUserDataUseCase: MockGetUserDataUseCaseProtocol!
    private var mockSaveUserUseCase: MockSaveUserUseCaseProtocol!
    
    private let injector = Injector.build(context: .tests(name: "LoginObservableObject"))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockRouterEventPool = MockRouterEventPool()
        mockLoginUseCase = MockLoginUseCaseProtocol()
        mockGetUserDataUseCase = MockGetUserDataUseCaseProtocol()
        mockSaveUserUseCase = MockSaveUserUseCaseProtocol()
        
        injector.register(RouterEventPool.self.self, key: AuthenticationRouterEventPool.name) { self.mockRouterEventPool }
        injector.register(LoginUseCaseProtocol.self) { self.mockLoginUseCase }
        injector.register(GetUserDataUseCaseProtocol.self) { self.mockGetUserDataUseCase }
        injector.register(SaveUserUseCaseProtocol.self) { self.mockSaveUserUseCase }
        
        sut = LoginObservableObject()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        mockRouterEventPool = nil
        mockLoginUseCase = nil
        mockGetUserDataUseCase = nil
        mockSaveUserUseCase = nil
        sut = nil
        
        injector.destroy()
    }
    
    func testPerformLoginFailsDueToInvalidUsername() async {
        sut.username.content = ""
        sut.password.content = "1234"
        
        await sut.performLogin()
        
        XCTAssertNotNil(sut.username.error)
    }
    
    func testPerformLoginFailsDueToInvalidPassword() async {
        sut.username.content = "test"
        sut.password.content = ""
        
        await sut.performLogin()
        
        XCTAssertNotNil(sut.password.error)
    }
    
    func testPerformLoginFails() async {
        sut.username.content = "test"
        sut.password.content = "1234"
        
        mockLoginUseCase.result = .failure(CommonError.generic)
        
        await sut.performLogin()
        
        XCTAssertEqual(sut.modals.count, 1)
    }
    
    func testPerformLoginSuccess() async {
        sut.username.content = "test"
        sut.password.content = "1234"
        
        let mockLoginResponse = LoginResponse(token: "")
        mockLoginUseCase.result = .success(mockLoginResponse)
        
        let mockUser = User(id: 0, email: "", username: "", firstName: "", lastName: "", phone: "", token: "")
        mockGetUserDataUseCase.result = .success(mockUser)
        
        mockSaveUserUseCase.error = nil
        
        await sut.performLogin()
        
        XCTAssert(mockRouterEventPool.emitWasCalled)
    }
}
