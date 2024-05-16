import Foundation

struct Reservation: Identifiable, Codable {
    var id = UUID()
    var movie: Movie
    var seats: [String]
    var time: String
}
