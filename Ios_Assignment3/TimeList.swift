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
        }
        .navigationTitle("Showtimes")
    }
    
//    struct MainTabView: View {
//        var body: some View {
//            TabView {
//                Home(key: UUID())
//                    .tabItem {
//                        Label("Home", systemImage: "house.fill")
//                    }
//
//                ReservedView()
//                    .tabItem {
//                        Label("Reserved", systemImage: "list.bullet.rectangle")
//                    }
//            }
//        }
//    }
//
//    struct ReservedView: View {
//        var body: some View {
//            Text("Reserved Movies")
//                .font(.title)
//                .padding()
//        }
//    }
//
    
    
}
