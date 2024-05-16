import SwiftUI

struct MainTabView: View {
//    @State private var selection: Tab = .home
//    @State private var homeKey: UUID = UUID()  // Unique key to reset Home view
//
//    enum Tab {
//        case home, reserved
//    }

    var body: some View {
//            TabView(selection: $selection) {
//                Home(key: homeKey)
//                    .tabItem {
//                        Label("Home", systemImage: "house.fill")
//                    }
//                    .tag(Tab.home)
//                    .onTapGesture {
//                        if selection == .home {
//                            homeKey = UUID()  // Reset the Home view by changing its key
//                        }
//                    }
//
//                ReservedView()
//                    .tabItem {
//                        Label("Reserved", systemImage: "list.bullet.rectangle")
//                    }
//                    .tag(Tab.reserved)
//            }
            TabView {
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                ReservedView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Reservations")
                    }
            }
        }
    }

    struct ReservedView: View {
        var body: some View {
            Text("Reserved Movies")
                .font(.title)
                .padding()
        }
    }

//    struct MainTabView_Previews: PreviewProvider {
//        static var previews: some View {
//            MainTabView()
//        }
//    }

#Preview {
    MainTabView()
}


