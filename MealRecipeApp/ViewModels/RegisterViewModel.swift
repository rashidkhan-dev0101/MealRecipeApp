//
//  RegisterViewModel.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation
import SwiftUI
import Firebase
import Combine

@MainActor
final class RegisterViewModel: ObservableObject {
    
    @Published var username: String = ""

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var didRegister: Bool = false   // ← new
    
    
    @MainActor
    func signInWithGoogle() async {

        errorMessage = nil

        do {

            _ = try await AuthenticationManager.shared.signInWithGoogle()

            didRegister = true

        } catch {

            errorMessage = error.localizedDescription
        }
    }

    func createAccount() {

        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill in all fields."
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Passwords don't match."
            return
        }

        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters."
            return
        }

        isLoading = true
        errorMessage = nil

        Task {
            do {
                try await AuthenticationManager.shared.createUser(
                    email: email,
                    password: password
                )
                try await AuthenticationManager.shared.updateUserName(username)
                didRegister = true   // ← triggers navigation
            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }

    }

}
