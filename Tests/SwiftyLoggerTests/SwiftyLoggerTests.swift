import XCTest
@testable import SwiftyLogger

class SwiftyLoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwiftyLogger().text, "Hello, World!")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
