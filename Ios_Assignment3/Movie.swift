import Foundation

struct Movie: Identifiable, Hashable, Codable {    
    var id = UUID()
    var title: String
    var description: String
    var runningtime: String
    var imageName: String  // Assuming you have images in your Assets.xcassets
}
