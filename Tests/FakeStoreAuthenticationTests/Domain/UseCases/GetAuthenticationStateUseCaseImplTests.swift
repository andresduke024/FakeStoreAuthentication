//
//  GetAuthenticationStateUseCaseImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class GetAuthenticationStateUseCaseImplTests: XCTestCase {

    private var sut: GetAuthenticationStateUseCaseImpl!
    
    private var mockGetUserUseCaseProtocol: MockGetUserUseCaseProtocol!
    
    private let injector = Injector.build(context: .tests(name: "GetAuthenticationStateUseCaseImpl"))
    
    override func setUpWithError() throws {
        mockGetUserUseCaseProtocol = MockGetUserUseCaseProtocol()
        
        injector.register(GetUserUseCaseProtocol.self) { self.mockGetUserUseCaseProtocol }
        
        sut = GetAuthenticationStateUseCaseImpl()
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        mockGetUserUseCaseProtocol = nil
        sut = nil
        
        injector.destroy()
        try super.tearDownWithError()
    }

    func testInvokeSuccessForUnauthenticatedUser() async {
        mockGetUserUseCaseProtocol.result = nil
        
        let result = await sut.invoke()
        
        XCTAssertEqual(result, .unauthenticated)
    }
    
    func testInvokeSuccessForAuthenticatedUser() async {
        mockGetUserUseCaseProtocol.result = User(id: 0, email: "", username: "", firstName: "", lastName: "", phone: "", token: "12345sf")
        
        let result = await sut.invoke()
        
        XCTAssertEqual(result, .authenticated)
    }
    
    func testInvokeSuccessForAuthenticatedUserWithoutToken() async {
        mockGetUserUseCaseProtocol.result = User(id: 0, email: "", username: "", firstName: "", lastName: "", phone: "", token: "")
        
        let result = await sut.invoke()
        
        XCTAssertEqual(result, .unauthenticated)
    }
}
