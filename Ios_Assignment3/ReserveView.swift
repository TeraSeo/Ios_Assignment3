import SwiftUI

struct ReserveView: View {
    
    var price: Int
    var title: String
    var subtitle: String
    var selectedSeats: Set<String>
    
    let screenWidth: Double = UIScreen.main.bounds.width
    let screenHeight: Double = UIScreen.main.bounds.height

    var sortedSeats: [String] {
        selectedSeats.sorted()
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var navigateToHome = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            VStack {
                HStack {
                    Image("109602")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth * 0.2, height: screenHeight * 0.2)
                        .padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        Text(subtitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
                
            Divider()
            
            Text("Selected Seats:")
                .font(.headline)
                .padding(.top)
            
            // Show the selected seat list
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                ForEach(sortedSeats, id: \.self) { seat in
                    Text(seat)
                        .font(.body)
                        .padding(8)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                }
            }
            .padding(.bottom, 10)
            
            Divider()
            
            // Display the total price
            Text("Total Price: \(sortedSeats.count * price) $")
                .font(.headline)
                .padding(.bottom, 10)
            
            Spacer()
            
            // Reserve button
            Button(action: saveReservation) {
                Text("Reserve")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
        }
        .padding()
        .navigationBarTitle("Reservation Confirmation", displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Reservation"), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                navigateToHome = true
            })
        }
        .background(
            NavigationLink(destination: HomeView(), isActive: $navigateToHome) {
                EmptyView()
            } // navigate to home on reservation completed
        )
    }
    
    // save the reservation in a persistent file
    private func saveReservation() {
        let reservation = Reservation(title: title, seats: sortedSeats)
        if PersistenceManager.shared.saveReservation(reservation) {
            alertMessage = "Reservation succeeded!"
        } else {
            alertMessage = "Reservation failed!"
        }
        showingAlert = true
    }
}
