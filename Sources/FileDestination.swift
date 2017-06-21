import Foundation


public struct FileDestination {
    
    private init() {}
    
    private enum FileDestinationError: Error {
        case createFile
    }
    
    public static func generateFile(path: String) -> Bool {
        do {
            let dirPath = path.pregMatch(pattern: ".*/")
            
            let fmg = FileManager.default
            try fmg.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
            
            if !fmg.fileExists(atPath: path) {
                if !fmg.createFile(atPath: path, contents: nil, attributes: nil) {
                    throw FileDestinationError.createFile
                }
            }
        
            return true
        } catch {
            return false
        }
    }
    
    public static func addMessage(path: String, message: String) {
        if let handle = FileHandle(forWritingAtPath: path) {
            handle.seekToEndOfFile()
            handle.write((message + "\n").data(using: String.Encoding.utf8)!)
            handle.closeFile()
        }
    }
    
}
