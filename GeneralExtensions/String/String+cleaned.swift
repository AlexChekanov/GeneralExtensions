import Foundation

extension String {
    
    var cleanedFromWhitespaces: String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    var cleanedFromNewLines: String {
        return self.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    var cleanedFromWhitespacesAndNewLines: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
