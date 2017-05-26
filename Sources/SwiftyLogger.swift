import Foundation

open class SwiftyLogger {
    
    private init() {}
    
    public static var instance: SwiftyLogger = {
        return SwiftyLogger()
    }()
    
    open var settings = LoggerSettings()
    
    private func logging(lebel: LogLebel, message optionalMessages : [String]?, fileName: String = #file, line: Int = #line ,funcName: String = #function) {
        
        if settings.isHidden {
            return
        }
        
        var output = lebel.emojiDescription()
        
        if !settings.isDateHidden {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = settings.dateFormat
            
            output += dateFormatter.string(from: Date()) + " "
        }
        
        output += "[" + lebel.description() + "] "
        
        if !settings.isFileNameHidden {
            output += "[" + fileName.pregReplace(pattern: ".*/", with: "") + ":" + String(line) + "] "
        }
        
        if !settings.isFunctionNameHidden {
            output += funcName
        }
        
        if let messages = optionalMessages {
            output += " ▶ " + messages.joined(separator: ", ")
        }
        
        if settings.isFileWrite {
            let path = settings.filePath.pregMatch(pattern: ".*/")
            let name = settings.filePath.pregReplace(pattern: ".*/", with: "")
            
            if FileDestination.generateFile(path: path, name: name) {
                FileDestination.addMessage(filePath: settings.filePath, message: output)
            }
        } else {
            print(output)
        }
    }
    
    open func verbose(message: String..., file: String = #file, line: Int = #line, function: String = #function) {
        self.logging(lebel: .verbose, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func debug(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logging(lebel: .debug, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func info(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logging(lebel: .info, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func warn(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logging(lebel: .warn, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func error(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.logging(lebel: .error, message: message, fileName: file, line: line, funcName: function)
    }
}
