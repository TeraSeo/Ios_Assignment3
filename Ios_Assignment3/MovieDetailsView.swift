// Movie detail view

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                Image(movie.title)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Text(movie.title)
                    .font(.largeTitle)
                    .padding()
                
                Text(movie.description)
                    .font(.body)
                    .padding()
                
                Text(movie.runningtime)
                    .font(.body)
                    .padding()
                
                NavigationLink(destination: TimeList(movie: movie)) {
                                    Text("Go to Booking")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                .padding(.top, 20)
            }
            .navigationTitle(movie.title)
        }
    }
}
