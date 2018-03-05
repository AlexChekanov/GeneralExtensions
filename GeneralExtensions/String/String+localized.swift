import Foundation

public extension String {
    func localized(withComment:String, in tableName: String) -> String {
        return NSLocalizedString (self, tableName: tableName, comment: withComment)
    }
}
