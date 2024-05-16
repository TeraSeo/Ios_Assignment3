import SwiftUI

@main
struct Main: App {
    
  // Initialize the PersistenceManager with username and title
  init() {
    PersistenceManager.initialize(username: "JohnDoe")
  }
    
  var body: some Scene {
    WindowGroup {
        StartView()
    }
  }
}

