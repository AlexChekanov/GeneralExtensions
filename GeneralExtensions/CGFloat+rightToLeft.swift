import UIKit

public extension CGFloat {
    
    func flipped(if condition: Bool, axis: CGFloat) -> CGFloat {
        
        let correction: CGFloat = condition ? 1 : -1
        
        return  (axis + ((axis - self) * correction))
    }
    
}
