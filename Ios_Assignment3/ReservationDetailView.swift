import SwiftUI

struct ReservationDetailView: View {
    var reservation: Reservation
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var navigateToHome = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(reservation.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            
            Text("Seats:")
                .font(.headline)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                ForEach(reservation.seats, id: \.self) { seat in
                    Text(seat)
                        .font(.body)
                        .padding(8)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            .padding(.bottom, 10)
            
            Spacer()
            
            Button(action: {
                cancelReservation(reservation: reservation)
            }) {
                Text("Cancel Reservation")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .padding()
        .navigationBarTitle("Reservation Details", displayMode: .inline)
        .alert(isPresented: $showingAlert) {
                Alert(title: Text("Reservation"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                    navigateToHome = true
                })
            }
            .background(
                NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                    EmptyView()
                }
            )
        
    }
    
    private func cancelReservation(reservation: Reservation) {
        let deletionSucceeded = PersistenceManager.shared.deleteReservation(reservation)
        if deletionSucceeded {
            alertMessage = "Reservation deletion succeeded!"
        } else {
            alertMessage = "Reservation deletion failed!"
        }
        showingAlert = true
    }
}
