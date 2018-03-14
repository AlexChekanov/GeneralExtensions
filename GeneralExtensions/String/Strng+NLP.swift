import Foundation

public extension String {
    
    var dominantLanguage: String? {
        let tagger = NSLinguisticTagger(tagSchemes: [.language], options: 0)
        tagger.string = self
        return tagger.dominantLanguage
    }
    
    var words: [String] {
        var wordList: Set<String> = []
        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        let range = NSRange(location: 0, length: self.utf16.count)
        
        tagger.string = self
        tagger.enumerateTags(in: range, unit: .word, scheme: NSLinguisticTagScheme.tokenType, options: options) { tag, tokenRange, stop in
            let word = (self as NSString).substring(with: tokenRange)
            wordList.insert(word)
        }
        return Array(wordList)
    }
    
    var lemmas: Set<String> {
        
        var lemmas: Set<String> = []
        
        let tagger = NSLinguisticTagger(tagSchemes: [.lemma, .language], options: 0)
        tagger.string = self
        let range = NSRange(location: 0, length: self.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) { tag, tokenRange, stop in
            if let lemma = tag?.rawValue {
                lemmas.insert(lemma)
            }
        }
        return lemmas
    }
    
    func lemmasFor(language: String) -> Set<String> {
        
        var lemmas: Set<String> = []
        
        let tagger = NSLinguisticTagger(tagSchemes: [.lemma], options: 0)
        tagger.string = self
        
        let orthography = NSOrthography.defaultOrthography(forLanguage: language)
        let range = NSRange(location: 0, length: self.utf16.count)
        
        tagger.setOrthography(orthography, range: range)
        
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .lemma, options: options) { tag, tokenRange, stop in
            if let lemma = tag?.rawValue {
                lemmas.insert(lemma)
            }
        }
        return lemmas
    }
    
    var names: (personas: Set<String>, places: Set<String>, organizations: Set<String>) {
        
        var personas: Set<String> = []
        var places: Set<String> = []
        var organizations: Set<String> = []
        
        let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
        tagger.string = self
        let range = NSRange(location:0, length: self.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            
            guard let tag = tag else { return }
            let token = (self as NSString).substring(with: tokenRange)
            
            switch tag {
                
            case .personalName: personas.insert(token)
            case .placeName: places.insert(token)
            case .organizationName: organizations.insert(token)
            default: break
            }
        }
        return (personas: personas, places: places, organizations: organizations)
    }
    
    func namesFor(language: String) -> (personas: Set<String>, places: Set<String>, organizations: Set<String>) {
        
        var personas: Set<String> = []
        var places: Set<String> = []
        var organizations: Set<String> = []
        
        let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
        tagger.string = self
        let range = NSRange(location:0, length: self.utf16.count)
        
        let orthography = NSOrthography.defaultOrthography(forLanguage: language)
        
        tagger.setOrthography(orthography, range: range)
        
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        
        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            
            guard let tag = tag else { return }
            let token = (self as NSString).substring(with: tokenRange)
            
            switch tag {
                
            case .personalName: personas.insert(token)
            case .placeName: places.insert(token)
            case .organizationName: organizations.insert(token)
            default: break
            }
        }
        return (personas: personas, places: places, organizations: organizations)
    }
}
