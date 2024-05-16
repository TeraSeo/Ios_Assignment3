import SwiftUI

struct SignUp: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false // State to control alert visibility
    @State private var alertMessage = "" // The message displayed in the alert
    @State private var isSignedUp = false // State to control navigation
    
    
    var body: some View {
//        NavigationView {
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
                    .keyboardType(.emailAddress)
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
                .background(name.isEmpty || email.isEmpty || password.isEmpty ? Color.gray : Color.black) // Button is gray if any field is empty
                                .cornerRadius(10)
                                .disabled(name.isEmpty || email.isEmpty || password.isEmpty) // Disable button if any field is empty

                NavigationLink("", destination: SignIn(), isActive: $isSignedUp)
                
                Spacer()
            }
            .navigationTitle("Sign Up")
            .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    func signupUser() {
            guard validateEmail(email) else {
                alertMessage = "Invalid email format. Please use a correct email."
                showingAlert = true
                return
            }
            
            // Here you would typically check against a backend or database
            UserDefaults.standard.set(name, forKey: "userName")
            UserDefaults.standard.set(email, forKey: "userEmail")
            UserDefaults.standard.set(password, forKey: "userPassword")
            // Assume registration is successful:
            self.isSignedUp = true // Triggers navigation to SignIn
        }

        func validateEmail(_ email: String) -> Bool {
            return email.contains("@") && email.contains(".")
        }
    }
    

#Preview {
    SignUp()
}

