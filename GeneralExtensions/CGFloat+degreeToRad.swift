import UIKit

public extension CGFloat {
    
    var radians: CGFloat {
        return self/180.0*CGFloat(Double.pi)
    }
}
