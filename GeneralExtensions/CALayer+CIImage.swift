//import UIKit
//import CoreImage
//
//extension CALayer {
//    
//    var ciImage: CIImage? {
//        
//        let size = self.frame.size
//        
//        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
//        guard let context = CGContext(data: nil, width: Int(UInt(size.width)), height: Int(UInt(size.height)), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue) else { return nil }
//        
//        self.render(in: context)
//        
//        guard let cgImage = context.makeImage() else { return nil }
//        return CIImage(cgImage: cgImage)
//    }
//}

