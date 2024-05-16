import Foundation
import SwiftUI

struct Showtime: Identifiable {
    var id = UUID()
    var time: String
    var isAvailable: Bool
}

// Time List Page - Displaying showtimes
struct TimeList: View {
    var movie: Movie
    @State private var selectedTime: UUID?

    // Sample showtimes data
    let showtimes = [
        Showtime(time: "14:00", isAvailable: true),
        Showtime(time: "16:30", isAvailable: true),
        Showtime(time: "19:00", isAvailable: false),  // Example of an unavailable showtime
        Showtime(time: "21:30", isAvailable: true)
    ]
    
    var selectedShowtime: Showtime? {
        showtimes.first { $0.id == selectedTime }
    }

    var body: some View {
        VStack {
            Text("Select a Showtime for \(movie.title)")
                .font(.headline)
                .padding()

            List(showtimes) { showtime in
                HStack {
                    Text(showtime.time)
                        .foregroundColor(showtime.isAvailable ? .black : .gray)
                    Spacer()
                    if selectedTime == showtime.id {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
                .contentShape(Rectangle())  // Makes the entire row tappable
                .onTapGesture {
                    if showtime.isAvailable {
                        selectedTime = showtime.id
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            if let selectedShowtime = selectedShowtime {
                NavigationLink(destination: SeatSelectView(price: 13, movie: movie, time: selectedShowtime.time)) {
                    Text("Book a Movie")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
        .navigationTitle("Showtimes")
    }
}
