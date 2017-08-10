import XCTest
@testable import SwiftyLogger

class SwiftyLoggerTests: XCTestCase {
    
    private let log = SwiftyLogger.instance
    
    func testLogger() {
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
    }
    
    func testLoggerHideLog() {
        print("Hide Log")
        
        log.settings.logHidden = true
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
        log.settings.logHidden = false
    }
    
    func testLoggerHideEmoji() {
        print("Hide Emoji")
        
        log.settings.showEmoji = false
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
        log.settings.showEmoji = true
    }
    
    func testLoggerHideDate() {
        print("Hide Date")
        
        log.settings.showDate = false
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
        log.settings.showDate = true
    }
    
    func testLoggerHideFileName() {
        print("Hide File Name")
        
        log.settings.showFileName = false
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
        log.settings.showFileName = true
    }
    
    func testLoggerHideFunctionName() {
        print("Hide Function Name")
        
        log.debug(message: "debug test")
        log.error(message: "error test")
        log.info(message: "info test")
        log.verbose(message: "verbose test")
        log.warn(message: "warn test")
        log.settings.showFunctionName = true
    }

    static var allTests = [
        ("testLogger", testLogger),
        ("testLoggerHideLog", testLoggerHideLog),
        ("testLoggerHideEmoji", testLoggerHideEmoji),
        ("testLoggerHideFileName", testLoggerHideFileName),
        ("testLoggerHideFunctionName", testLoggerHideFunctionName),
    ]
}
