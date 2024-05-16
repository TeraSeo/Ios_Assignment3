import Foundation

class PersistenceManager {
    static var shared: PersistenceManager!

    private var fileName: String
    private var reservations: [Reservation] = []

    private init(username: String) {
        self.fileName = "\(username).json"
        loadReservations()
    }

    static func initialize(username: String) {
        shared = PersistenceManager(username: username)
    }

    private var fileURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
    }

    func saveReservation(_ reservation: Reservation) -> Bool {
        reservations.append(reservation)
        return saveReservationsToFile()
    }

    func getReservations() -> [Reservation] {
        return reservations
    }

    func getReservedSeats(title: String) -> Set<String> {
        var reservedSeats = Set<String>()
        for reservation in reservations {
            if reservation.title == title {
                reservedSeats.formUnion(reservation.seats)
            }
        }
        return reservedSeats
    }

    private func saveReservationsToFile() -> Bool {
        do {
            let data = try JSONEncoder().encode(reservations)
            try data.write(to: fileURL)
            return true
        } catch {
            print("Failed to save reservations: \(error.localizedDescription)")
            return false
        }
    }

    func deleteReservation(_ reservation: Reservation) -> Bool {
        if let index = reservations.firstIndex(where: { $0.id == reservation.id }) {
            reservations.remove(at: index)
            return saveReservationsToFile()
        }
        return false
    }

    private func loadReservations() {
        do {
            let data = try Data(contentsOf: fileURL)
            reservations = try JSONDecoder().decode([Reservation].self, from: data)
        } catch {
            print("Failed to load reservations: \(error.localizedDescription)")
        }
    }
}
