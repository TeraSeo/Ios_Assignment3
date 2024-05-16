import Foundation

class UserManager {
    static let shared = UserManager()
    
    private let usersKey = "users"
    
    private init() {}
    
    func saveUser(_ user: User) {
        var users = getUsers()
        users.append(user)
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: usersKey)
        }
    }
    
    func getUsers() -> [User] {
        if let savedUsers = UserDefaults.standard.data(forKey: usersKey) {
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: savedUsers) {
                return decodedUsers
            }
        }
        return []
    }
}
