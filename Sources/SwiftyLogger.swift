import Foundation

open class SwiftyLogger {
    
    private init() {}
    
    public static let instance: SwiftyLogger = {
        return SwiftyLogger()
    }()
    
    open var settings = LoggerSettings()
    
    private func loggIn(lebel: LogLebel, message optionalMessages : [String]?, fileName: String = #file, line: Int = #line ,funcName: String = #function) {
        
        if settings.isHidden {
            return
        }
        
        var output = lebel.emojiDescription()
        
        if !settings.isDateHidden {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = settings.dateFormat
            
            //add date
            output += dateFormatter.string(from: Date()) + " "
        }
        
        output += "[" + lebel.description() + "] "
        
        if !settings.isFileNameHidden {
            
            //add file Name
            output += "[" + fileName.pregReplace(pattern: ".*/", with: "") + ":" + String(line) + "] "
        }
        
        if !settings.isFunctionNameHidden {
            
            //add function Name
            output += funcName
        }
        
        if let messages = optionalMessages {
            
            //add message
            output += " ▶ " + messages.joined(separator: ", ")
        }
        
        if settings.isFileWrite {
            let path = settings.filePath.pregMatch(pattern: ".*/")
            let name = settings.filePath.pregReplace(pattern: ".*/", with: "")
            
            if FileDestination.generateFile(path: path, name: name) {
                
                //add to file output
                FileDestination.addMessage(filePath: settings.filePath, message: output)
            }
        } else {
            print(output)
        }
    }
    
    open func verbose(message: String..., file: String = #file, line: Int = #line, function: String = #function) {
        self.loggIn(lebel: .verbose, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func debug(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.loggIn(lebel: .debug, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func info(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.loggIn(lebel: .info, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func warn(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.loggIn(lebel: .warn, message: message, fileName: file, line: line, funcName: function)
    }
    
    open func error(message: String..., file: String = #file, line: Int = #line ,function: String = #function) {
        self.loggIn(lebel: .error, message: message, fileName: file, line: line, funcName: function)
    }
}
