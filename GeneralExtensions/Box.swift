// Boxing alows to store value types and pass them as a class
public final class Box<T> {
    
    var value: T
    
    init (value: T) {
        
        self.value = value
    }
}

