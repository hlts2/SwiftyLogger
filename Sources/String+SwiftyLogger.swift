import Foundation

internal extension String {
    
    func pregReplace(pattern: String, with: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        
        return regex.stringByReplacingMatches(in: self, range: NSMakeRange(0, self.characters.count), withTemplate: with)
    }
    
    func pregMatch(pattern: String, options: NSRegularExpression.Options = []) -> String {
        let regex = try! NSRegularExpression(pattern: pattern, options: options)
        let result = regex.firstMatch(in: self, range: NSMakeRange(0, self.characters.count))!
        
        return (self as NSString).substring(with: result.rangeAt(0))
    }
}
