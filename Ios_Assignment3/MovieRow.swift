// View for each row in the movie list

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.title) //This load movie image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 100)
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
