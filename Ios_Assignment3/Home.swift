import Foundation
import SwiftUI

// Movie model
struct Movie: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var imageName: String  // Assuming you have images in your Assets.xcassets
}

// Sample data for movies
let sampleMovies = [
    Movie(title: "Inception", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.", imageName: "inception"),
    Movie(title: "Interstellar", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", imageName: "interstellar"),
    Movie(title: "The Dark Knight", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", imageName: "thedarkknight"),
    Movie(title: "Harry Potter and the Sorcerer's Stone", description: "An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.", imageName: "harrypotter"),
    Movie(title: "About Time", description: "At the age of 21, Tim discovers he can travel in time and change what happens and has happened in his own life. His decision to make his world a better place by getting a girlfriend turns out not to be as easy as you might think.", imageName: "abouttime"),
    Movie(title: "PRIDE & PREJUDICE", description: "Sparks fly when spirited Elizabeth Bennet meets single, rich, and proud Mr. Darcy. But Mr. Darcy reluctantly finds himself falling in love with a woman beneath his class. Can each overcome their own pride and prejudice?", imageName: "pride&prejudice")
]

struct Home: View {
    var movies: [Movie] = sampleMovies  // This could be replaced by a dynamic data source

    var body: some View {
        NavigationView {
            List(movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Movies")
        }
    }
}

// View for each row in the movie list
struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 60)
                .clipped()
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                //movie title
                Text(movie.title)
                    .font(.headline)
                //movie description
                Text(movie.description)
                    .font(.subheadline)
                    .lineLimit(2)
                    .truncationMode(.tail)
            }
            .padding(.leading, 10)
        }
        .padding(.vertical, 8)
    }
}

// Movie detail view
struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                Image(movie.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Text(movie.title)
                    .font(.largeTitle)
                    .padding()
                
                Text(movie.description)
                    .font(.body)
                    .padding()
            }
            .navigationTitle(movie.title)
        }
    }
}

#Preview {
    Home()
}
