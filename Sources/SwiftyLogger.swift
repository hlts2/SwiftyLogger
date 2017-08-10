import Foundation

open class SwiftyLogger {
    
    private init() {}
    
    public static let instance: SwiftyLogger = {
        return SwiftyLogger()
    }()
    
    open var settings = LoggerSettings()
    
    private func logIn(lebel: LogLebel, message : [String]?, fileName: String = #file, line: Int = #line ,funcName: String = #function) {
        
        if settings.logHidden {
            return
        }

        var output = ""
        
        if settings.showEmoji {
            output += lebel.emojiDescription()
        }
        
        if settings.showDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = settings.dateFormat
            
            output += dateFormatter.string(from: Date()) + " "
        }
        
        output += "[" + lebel.description() + "] "
        
        if settings.showFileName {
            output += "[" + fileName.pregReplace(pattern: ".*/", with: "") + ":" + String(line) + "] "
        }
        
        if settings.showFunctionName {
            output += funcName
        }
        
        if let messages = message {
            output += " ▶ " + messages.joined(separator: ", ")
        }
        
        if settings.isFileWrite {
            if FileDestination.generateFile(path: settings.filePath) {
                FileDestination.addMessage(path: settings.filePath, message: output)
            }
        } else {
            print(output)
        }
    }
    
    open func verbose(message: String..., file: String = #file, line: Int = #line, function: String = #function) {
        self.logIn(lebel: .verbose, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func debug(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logIn(lebel: .debug, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func info(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logIn(lebel: .info, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func warn(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logIn(lebel: .warn, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func error(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logIn(lebel: .error, message: message, fileName: file, line: line, funcName: function)
    }
}
