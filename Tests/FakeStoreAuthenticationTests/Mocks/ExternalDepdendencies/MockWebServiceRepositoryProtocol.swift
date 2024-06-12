//
//  File.swift
//  
//
//  Created by Andres Duque on 30/05/24.
//

import Foundation
@testable import FakeStoreCommons

final class MockWebServiceRepositoryProtocol: WebServiceRepositoryProtocol {
    
    var result: Decodable?
    var error: Error?
    
    func fetch<T: Decodable>(
        url: String?,
        method: HTTPMethod,
        body: Encodable?
    ) async throws -> T {
        if let error {
            throw error
        }
        
        guard let result, let data = result as? T else {
            throw CommonError.generic
        }

        return data
    }
}
