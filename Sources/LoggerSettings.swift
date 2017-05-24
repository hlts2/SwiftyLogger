import Foundation

public struct LoggerSettings {
    
    public var dateFormat           = "yyyy-MM-dd HH:mm:ss.SSS"
    public var filePath             = "/tmp/SwiftyLogger.log"
    
    public var isHidden             = false
    public var isDateHidden         = false
    public var isFunctionNameHidden = false
    public var isFileNameHidden     = false
    public var isFileWrite          = false
}
