public extension String {
    
    var longestWord: String {
        if let max = self.wordList.max(by: {$1.count > $0.count}) {
            return max
        } else {return ""}
    }
}
