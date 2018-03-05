import Foundation

public extension Sequence where Element == () -> Void {
    
    func callAll() {
        for closure in self {
            closure()
        }
    }
}

public extension Sequence where Element == () throws -> Void {
    
    func callAllThrowing() throws {
        for closure in self {
            
            do { try closure() }
            catch { throw error }
        }
    }
}
