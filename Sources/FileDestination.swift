import Foundation

public struct FileDestination {
    
    private init() {}
    
    public static func generateFile(path: String, name: String) -> Bool {
        
        do {
            let fMng = FileManager.default
            try fMng.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            
            if !fMng.fileExists(atPath: path + name) {
                if !fMng.createFile(atPath: path + name, contents: nil, attributes: nil) {
                    throw NSError()
                }
            }
            
            return true
        } catch {
            print("\(error)")
            
            return false
        }
    }
    
    public static func addMessage(filePath: String, message: String) {
        let handle = FileHandle(forWritingAtPath: filePath)
        
        handle?.seekToEndOfFile()
        handle?.write((message + "\n").data(using: String.Encoding.utf8)!)
        handle?.closeFile()
    }
    
}
