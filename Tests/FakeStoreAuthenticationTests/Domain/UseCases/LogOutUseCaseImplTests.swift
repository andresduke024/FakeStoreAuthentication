//
//  LogOutUseCaseImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class LogOutUseCaseImplTests: XCTestCase {

    private var sut: LogOutUseCaseImpl!
    
    private var mockLocalStorageRepository: MockLocalStorageRepository!
    
    private let injector = Injector.build(context: .tests(name: "LogOutUseCaseImpl"))
    
    override func setUpWithError() throws {
        mockLocalStorageRepository = MockLocalStorageRepository()
        
        injector.register(LocalStorageRepositoryProtocol.self) { self.mockLocalStorageRepository }
        
        sut = LogOutUseCaseImpl()
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        mockLocalStorageRepository = nil
        sut = nil
        
        injector.destroy()
        try super.tearDownWithError()
    }

    func testInvokeSuccess() async {
        await sut.invoke()
        
        XCTAssert(mockLocalStorageRepository.removeWasCalled)
    }
}
