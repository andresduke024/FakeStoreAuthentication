//
//  File.swift
//  
//
//  Created by Andres Duque on 12/06/24.
//

import XCTest

extension XCTestCase {
    func XCTAssertThrowsErrorAsync<T>(
        _ expression: @autoclosure () async throws -> T,
        _ message: @autoclosure () -> String = "This method should fail",
        file: StaticString = #filePath,
        line: UInt = #line
    ) async {
        do {
            let _ = try await expression()
            XCTFail(message(), file: file, line: line)
        } catch {
            XCTAssert(true)
        }
    }

    func XCTAssertThrowsNoErrorAsync<T>(
        _ expression: @autoclosure () async throws -> T,
        _ message: @autoclosure () -> String = "This method should not fail",
        file: StaticString = #filePath,
        line: UInt = #line
    ) async {
        do {
            let _ = try await expression()
            XCTAssert(true)
        } catch {
            XCTFail(message(), file: file, line: line)
        }
    }
}
