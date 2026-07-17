//
//  GoogleSignInHelper.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import Foundation
import GoogleSignIn
import FirebaseAuth
import Firebase
import UIKit

final class GoogleSignInHelper {

    static let shared = GoogleSignInHelper()

    private init() {}

    func signIn() async throws -> AuthDataResultModel {

        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw URLError(.badServerResponse)
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        guard
            let scene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let rootViewController = await scene.windows.first?.rootViewController
        else {
            throw URLError(.cannotFindHost)
        }

        let result = try await GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController
        )

        guard
            let idToken = result.user.idToken?.tokenString
        else {
            throw URLError(.badServerResponse)
        }

        let accessToken = result.user.accessToken.tokenString

        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: accessToken
        )

        let authResult = try await Auth.auth().signIn(with: credential)

        return AuthDataResultModel(user: authResult.user)
    }
}
