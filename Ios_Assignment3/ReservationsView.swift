import SwiftUI

struct ReservationsView: View {
    var body: some View {
        List {
            ForEach(groupedReservations.keys.sorted(), id: \.self) { title in
                Section(header: Text(title).font(.headline)) {
                    ForEach(groupedReservations[title] ?? []) { reservation in
                        NavigationLink(destination: ReservationDetailView(reservation: reservation)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Seats: \(reservation.seats.joined(separator: ", "))")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Reservations", displayMode: .inline)
        .navigationBarHidden(true)
    }
    
    private var groupedReservations: [String: [Reservation]] {
        Dictionary(grouping: PersistenceManager.shared.getReservations(), by: { $0.title })
    }
}
