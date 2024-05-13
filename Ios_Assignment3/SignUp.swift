import SwiftUI

struct SignUp: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignedUp = false // State to control navigation
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 50)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Sign up") {
                    // Handle registration logic here
                    signupUser()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                NavigationLink("", destination: SignIn(), isActive: $isSignedUp)
                
                Spacer()
            }
            .navigationTitle("Sign Up")
        }
    }

    func signupUser(){
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")
        // Implement registration logic here
        // After successful registration:
        self.isSignedUp = true // Triggers navigation to SignIn
    }
}
    

#Preview {
    SignUp()
}

