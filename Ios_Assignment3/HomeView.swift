//import SwiftUI
//
//struct HomeView: View {
//    var body: some View {
//        NavigationView {
//            TabView {
//                MainView()
//                    .tabItem {
//                        Image(systemName: "house.fill")
//                        Text("Home")
//                    }
//                
//                ReservationsView()
//                    .tabItem {
//                        Image(systemName: "list.bullet")
//                        Text("Reservations")
//                    }
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}
//
//struct MainView: View {
//    var body: some View {
//        NavigationLink(destination: SeatSelectView(title: "Movie", subtitle: "hello", price: 13)) {
//            Text("Book a Movie")
//                .font(.headline)
//                .padding()
//                .background(Color.blue)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//        }
//        .padding(.top, 20)
//        .navigationBarTitle("Home", displayMode: .inline)
//        .navigationBarHidden(true)
//    }
//}
//
//
