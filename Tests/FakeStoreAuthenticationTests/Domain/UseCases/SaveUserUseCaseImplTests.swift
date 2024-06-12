//
//  SaveUserUseCaseImplTests.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication
@testable import SwiftDependencyInjector

final class SaveUserUseCaseImplTests: XCTestCase {

    private var sut: SaveUserUseCaseImpl!
    
    private var mockLocalStorageRepository: MockLocalStorageRepository!
    
    private let injector = Injector.build(context: .tests(name: "SaveUserUseCaseImpl"))
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        mockLocalStorageRepository = MockLocalStorageRepository()
        injector.register(LocalStorageRepositoryProtocol.self) { self.mockLocalStorageRepository }
        
        sut = SaveUserUseCaseImpl()
    }

    override func tearDownWithError() throws {
        mockLocalStorageRepository = nil
        
        sut = nil
        injector.destroy()
        try super.tearDownWithError()
    }

    func testInvokeSuccess() async throws {
        let mockUser = User(id: 0, email: "", username: "", firstName: "", lastName: "", phone: "", token: "")
        
        try await sut.invoke(mockUser)
        
        XCTAssert(mockLocalStorageRepository.saveWasCalled)
    }

}
