import SwiftUI

struct SeatSelectView: View {
    
    var title: String
    var subtitle: String
    var price: Int
    
    let rows = 5
    let columns = 8
    @State private var selectedSeats: Set<String> = []
    @State private var reservedSeats: Set<String>
    
    let screenWidth: Double = UIScreen.main.bounds.width
    let screenHeight: Double = UIScreen.main.bounds.height
    
    init(title: String, subtitle: String, price: Int) {
        self.title = title
        self.subtitle = subtitle
        self.price = price
        reservedSeats = PersistenceManager.shared.getReservedSeats(title: title)
    }
    
    var body: some View {
        ScrollView {
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
                            
                            Text("\(price)$")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "checkmark.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.green)
                                .frame(width: screenWidth * 0.07, height: screenWidth * 0.07)
                                .padding(2)
                            Text("Selected")
                                .font(.headline)
                                .foregroundColor(.green)
                        }
                        HStack {
                            Image(systemName: "square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.gray)
                                .frame(width: screenWidth * 0.07, height: screenWidth * 0.07)
                                .padding(2)
                            Text("Not selected")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image(systemName: "square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                                .frame(width: screenWidth * 0.07, height: screenWidth * 0.07)
                                .padding(2)
                            Text("Reserved")
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                        
                    }
                    
                    Spacer()
                    
                    Image("movie_theatre_img") // Replace with the actual image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth * 0.4, height: screenHeight * 0.2)
                        .cornerRadius(8)
                        .padding(.trailing, 10)
                    
                }
                .padding(.leading)
                
                Text("Select Your Seats")
                    .font(.headline)
                    .padding()
                
                HStack {
                    Text("")
                        .frame(minWidth: screenWidth * 0.07)
                    ForEach(1...columns, id: \.self) { column in
                        Text("\(column)")
                            .frame(minWidth: screenWidth * 0.08)
                    }
                }
                
                // Grid of seats
                ForEach(0..<rows, id: \.self) { row in
                    HStack {
                        // Vertical letter labels
                        Text(String(UnicodeScalar(65 + row)!))
                            .frame(minWidth: screenWidth * 0.07)
                        ForEach(0..<columns, id: \.self) { column in
                            let seatID = "\(String(UnicodeScalar(65 + row)!))\(column + 1)"
                            SeatButton(isSelected: selectedSeats.contains(seatID), isReserved: reservedSeats.contains(seatID)) {
                                if reservedSeats.contains(seatID) {
                                    return
                                }
                                if selectedSeats.contains(seatID) {
                                    selectedSeats.remove(seatID)
                                } else {
                                    selectedSeats.insert(seatID)
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                // Seat selection confirm button
                NavigationLink(destination: ReserveView(price: 13, title: title, subtitle: subtitle, selectedSeats: selectedSeats)) {
                    Text("Confirm")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(selectedSeats.isEmpty)
                
            }
            .padding()
        }
        .navigationBarTitle("Select Seats", displayMode: .inline)
    }
}
