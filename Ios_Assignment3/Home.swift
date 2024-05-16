import Foundation
import SwiftUI

// Movie model
struct Movie: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var description: String
    var runningtime: String
    var imageName: String  // Assuming you have images in your Assets.xcassets
}

// Sample data for movies
let sampleMovies = [
    Movie(title: "Inception", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.", runningtime:  "Running Time: 145 min", imageName: "Inception"),
    Movie(title: "Interstellar", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", runningtime:  "Running Time: 160 min", imageName: "Interstellar"),
    Movie(title: "The Dark Knight", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", runningtime:  "Running Time: 120 min", imageName: "thedarknight"),
    Movie(title: "Harry Potter and the Sorcerer's Stone", description: "An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.", runningtime:  "Running Time: 105 min", imageName: "HarryPotter"),
    Movie(title: "About Time", description: "At the age of 21, Tim discovers he can travel in time and change what happens and has happened in his own life. His decision to make his world a better place by getting a girlfriend turns out not to be as easy as you might think.", runningtime:  "Running Time: 130 min", imageName: "AboutTime"),
    Movie(title: "PRIDE & PREJUDICE", description: "Sparks fly when spirited Elizabeth Bennet meets single, rich, and proud Mr. Darcy. But Mr. Darcy reluctantly finds himself falling in love with a woman beneath his class. Can each overcome their own pride and prejudice?", runningtime:  "Running Time: 119 min", imageName: "Pride&Prejudice")
]

struct Home: View {
    var movies: [Movie] = sampleMovies // This could be replaced by a dynamic data source
//    var key: UUID
    
    var body: some View {
//        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieRow(movie: movie)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding()
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
//        }
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movie: movie)
            }
//            .id(key) Use the key here to refresh view
        }
    }



//#Preview {
//    Home()
//}
//// MARK: - Preview Provider
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()  // Create an instance of Home for previewing
//    }
//}
