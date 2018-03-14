public extension String {
    
    var wordList: [String] {
        return Array(Set(components(separatedBy: .punctuationCharacters).joined(separator: "").components(separatedBy: " "))).filter {$0.count > 0}
    }
}
