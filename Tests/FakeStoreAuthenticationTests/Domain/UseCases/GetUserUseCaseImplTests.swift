//
//  GetUserUseCaseImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class GetUserUseCaseImplTests: XCTestCase {

    private var sut: GetUserUseCaseImpl!
    
    private var mockLocalStorageRepository: MockLocalStorageRepository!
    
    private let injector = Injector.build(context: .tests(name: "GetUserUseCaseImpl"))
    
    override func setUpWithError() throws {
        mockLocalStorageRepository = MockLocalStorageRepository()
        
        injector.register(LocalStorageRepositoryProtocol.self) { self.mockLocalStorageRepository }
        
        sut = GetUserUseCaseImpl()
        
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        mockLocalStorageRepository = nil
        sut = nil
        
        injector.destroy()
        try super.tearDownWithError()
    }

    func testInvokeSuccess() async {
        let _ = await sut.invoke()
        
        XCTAssert(mockLocalStorageRepository.getWasCalled)
    }
}
