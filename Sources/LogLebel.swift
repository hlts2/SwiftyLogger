import Foundation

public enum LogLebel: Int {
    case verbose = 0
    case debug
    case info
    case warn
    case error
    
    public func description() -> String {
        
        switch self {
        case .verbose:
            return "VERBOSE"
        case .debug:
            return "DEBUG"
        case .info:
            return "INFO"
        case .warn:
            return "WARN"
        case .error:
            return "ERROR"
        }
    }
    
    public func emojiDescription() -> String {
        
        switch self {
        case .verbose:
            return "🔭 🔭 "
        case .debug:
            return "🐛 🐛 "
        case .info:
            return "ℹ️ ℹ️ "
        case .warn:
            return "⚠️ ⚠️ "
        case .error:
            return "💣 💥 "
        }
    }
}
