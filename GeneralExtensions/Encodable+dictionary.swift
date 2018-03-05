import Foundation

public extension Encodable {
    
    var dictionary: [String: Any] {
        
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self), options: .allowFragments)) as? [String: Any] ?? [:]
    }
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
