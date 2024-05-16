import SwiftUI

struct MainTabView: View {

    var body: some View {

            ZStack {
                TabView {
                    Home()
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    
                    ReservationsView()
                        .tabItem {
                            Image(systemName: "list.bullet")
                            Text("Reservations")
                        }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
