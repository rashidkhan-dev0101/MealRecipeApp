import Foundation
import FirebaseAuth
import Combine

@MainActor
final class ProfileViewModel: ObservableObject {

    @Published var name = ""
    @Published var email = ""
    @Published var photoURL: URL?

    @Published var isLoading = false
    @Published var errorMessage: String?

    init() {
        loadUser()
    }

    func loadUser() {

        guard let user = AuthenticationManager.shared.getUserProfile() else {
            return
        }

        name = user.name
        email = user.email

        if let urlString = user.photoURL {
            photoURL = URL(string: urlString)
        }

    }

    func logout() throws {
        try AuthenticationManager.shared.signOut()
    }

}
