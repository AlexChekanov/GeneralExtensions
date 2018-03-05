import Foundation
import UIKit
import AVKit

public extension Data {
 
    var image: UIImage? { return UIImage(data: self) }
    var audioPlayer: AVAudioPlayer? { return try? AVAudioPlayer(data: self) }
}
