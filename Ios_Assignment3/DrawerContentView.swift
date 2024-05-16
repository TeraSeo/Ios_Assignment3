import SwiftUI

struct DrawerContentView: View {
    @Binding var isDrawerOpen: Bool
    @Binding var isSignedOut: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Button(action: {
                isDrawerOpen = false
                isSignedOut = true
            }) {
                HStack {
                    Image(systemName: "power")
                        .foregroundColor(.white)
                    Text("Logout")
                        .foregroundColor(.white)
                }
                .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}
