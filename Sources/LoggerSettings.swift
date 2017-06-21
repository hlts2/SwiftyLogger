import Foundation

public struct LoggerSettings {
    public var dateFormat           = "yyyy-MM-dd HH:mm:ss.SSS"
    public var filePath             = "/tmp/SwiftyLogger.log"
    
    public var isLogHidden          = false
    public var showEmoji            = true
    public var showDate             = true
    public var showFunctionName     = true
    public var showFileName         = true
    public var isFileWrite          = false
}
