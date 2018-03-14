public protocol OptionalString {}

extension String: OptionalString {}

public extension Optional where Wrapped: OptionalString {
    
    public var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}
