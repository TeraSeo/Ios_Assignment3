import Foundation

struct Reservation: Identifiable, Codable {
    var id = UUID()
    var title: String
    var seats: [String]
}
