import UIKit

public extension String {
    
    func longestWord(_ attributes: [NSAttributedStringKey:Any] = [
        NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body),
        NSAttributedStringKey.baselineOffset: 0
        ]) -> String? {
        
        return self.words.sorted {
            $0.size(withAttributes: attributes).width > $1.size(withAttributes: attributes).width
            }.first
    }
}
