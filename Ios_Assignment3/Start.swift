import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Cinema")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 20)
                
                Text("UTS CINEMAS")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 50)
                
                NavigationLink(destination: SignUp()) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SignIn()) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    StartView()
}

