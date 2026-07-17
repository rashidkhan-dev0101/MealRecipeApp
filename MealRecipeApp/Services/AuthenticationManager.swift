
import FirebaseAuth
import Firebase
import GoogleSignIn


final class AuthenticationManager {
    
    
    struct UserProfile {

        let uid: String
        let name: String
        let email: String
        let photoURL: String?

    }

    static let shared = AuthenticationManager()
    private init() { }
    
    func updateUserName(_ name: String) async throws {

        guard let user = Auth.auth().currentUser else {
            return
        }

        let request = user.createProfileChangeRequest()
        request.displayName = name

        try await request.commitChanges()
    }
    
    
    
    func getUserProfile() -> UserProfile? {

        guard let user = Auth.auth().currentUser else {
            return nil
        }

        return UserProfile(
            uid: user.uid,
            name: user.displayName ?? "User",
            email: user.email ?? "",
            photoURL: user.photoURL?.absoluteString
        )
    }

    @discardableResult
    func signInUser(
        email: String,
        password: String
    ) async throws -> AuthDataResultModel {

        let authDataResult = try await Auth.auth().signIn(
            withEmail: email,
            password: password
        )

        return AuthDataResultModel(user: authDataResult.user)
    }

    @discardableResult
    func createUser(
        email: String,
        password: String
    ) async throws -> AuthDataResultModel {

        let authDataResult = try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )

        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }

    func getCurrentUserID() -> String? {
        Auth.auth().currentUser?.uid
    }

    func getCurrentUser() -> User? {
        Auth.auth().currentUser
    }

    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    @discardableResult
    func signInWithGoogle() async throws -> AuthDataResultModel {
        try await GoogleSignInHelper.shared.signIn()
    }
}
