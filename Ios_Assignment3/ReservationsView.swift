import SwiftUI

struct ReservationsView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            if !username.isEmpty {
                Text("Welcome, \(username)!")
                    .font(.headline)
                    .padding(.top)
            }
            
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
        }
        .navigationBarTitle("Reservations", displayMode: .inline)
        .navigationBarHidden(true)
        .onAppear {
            // Retrieve the username from UserDefaults
            if let savedUsername = UserDefaults.standard.string(forKey: "loggedInUsername") {
                self.username = savedUsername
            }
        }
    }
    
    
    private var groupedReservations: [String: [Reservation]] {
        Dictionary(grouping: PersistenceManager.shared.getReservations(), by: { $0.movie.title })
    }
}
