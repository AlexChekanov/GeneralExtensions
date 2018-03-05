import CoreImage

public extension CIImage {
    
    func multiply(with ciImage: CIImage) -> CIImage? {
        return CIFilter(name: "CIMultiplyBlendMode", withInputParameters: ["inputImage":ciImage, "inputBackgroundImage":self])?.outputImage
    }
}
