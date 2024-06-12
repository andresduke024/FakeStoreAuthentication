//
//  MockEnvironmentValuesProviderProtocol.swift
//
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
@testable import FakeStoreCommons

final class MockEnvironmentValuesProviderProtocol: EnvironmentValuesProviderProtocol {
    
    var result: Any?
    
    func get<T>(_ key: EnvironmentValuesKeys) -> T? {
        return result as? T
    }
}
