 import Foundation
 
 public struct LocalizedString: ExpressibleByStringLiteral, Equatable {
    
    public let v: String
    
    public init(key: String) {
        self.v = NSLocalizedString(key, comment: "")
    }
    public init(localized: String) {
        self.v = localized
    }
    public init(stringLiteral value:String) {
        self.init(key: value)
    }
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(key: value)
    }
    public init(unicodeScalarLiteral value: String) {
        self.init(key: value)
    }
 }
 
 public func ==(lhs:LocalizedString, rhs:LocalizedString) -> Bool {
    return lhs.v == rhs.v
 }
