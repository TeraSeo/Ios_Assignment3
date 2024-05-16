import SwiftUI

struct SignIn: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated = false
    @State private var showingAlert = false

    var body: some View {
        VStack {
            Image(systemName: "film")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 50)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Sign In") {
                // Perform sign-in logic here
                authenticateUser()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("Invalid email or password"), dismissButton: .default(Text("OK")))
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(10)
            
            Spacer()
        }
        .navigationTitle("Sign In")
        .background(
            // Use NavigationLink's new navigation triggering method
            NavigationLink(destination: MainTabView(), isActive: $isAuthenticated) {
                EmptyView()
            }
            .hidden() // Hide the NavigationLink itself
        )
    }

    func authenticateUser() {
        let users = UserManager.shared.getUsers()
        
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            PersistenceManager.initialize(username: user.name)
            UserDefaults.standard.set(user.name, forKey: "loggedInUsername")
            isAuthenticated = true
        } else {
            showingAlert = true
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
