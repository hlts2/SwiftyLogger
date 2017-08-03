import XCTest
@testable import SwiftyLogger

class SwiftyLoggerTests: XCTestCase {
    
    
    func testLogger() {
        let log = SwiftyLogger.instance
        
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
    }

    static var allTests = [
        ("testLogger", testLogger),
    ]
}
