//
//  MockRouterEventPool.swift
//
//
//  Created by Andres Duque on 12/06/24.
//

import Foundation
import Combine
@testable import FakeStoreCommons
@testable import FakeStoreAuthentication

final class MockRouterEventPool: RouterEventPool {
    var publisher: PassthroughSubject<FakeStoreCommons.RouterEvent, Never> {
        PassthroughSubject<FakeStoreCommons.RouterEvent, Never>()
    }
    
    var emitWasCalled: Bool = false
    func emit(_ event: FakeStoreCommons.RouterEvent) {
        emitWasCalled = true
    }
}
