//
//  AuthenticationPackageBuilderTests.swift
//  
//
//  Created by Andres Duque on 30/05/24.
//

import XCTest
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class AuthenticationPackageBuilderTests: XCTestCase {

    private var sut: AuthenticationPackageBuilder!
    
    private var injector: Injector {
        Injector.global
    }
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AuthenticationPackageBuilder()
    }

    override func tearDownWithError() throws {
        injector.destroy()
        try super.tearDownWithError()
    }

    func testStartRegisterAuthRepositoryProtocolSuccess() {
        sut.start()
        
        let result = injector.getCurrentKey(of: AuthRepositoryProtocol.self)
        
        XCTAssertNotNil(result)
    }
    
    func testStartRegisterLoginUseCaseProtocolSuccess() {
        sut.start()
        
        let result = injector.getCurrentKey(of: LoginUseCaseProtocol.self)
        
        XCTAssertNotNil(result)
    }
}
