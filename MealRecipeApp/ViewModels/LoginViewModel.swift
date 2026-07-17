//
//  LoginViewModel.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var didLogin: Bool = false

    // MARK: - Email Login

    func login() {

        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter your email and password."
            return
        }

        isLoading = true
        errorMessage = nil

        Task {
            do {
                _ = try await AuthenticationManager.shared.signInUser(
                    email: email,
                    password: password
                )

                didLogin = true

            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }
    }

    // MARK: - Google Login

    func signInWithGoogle() async {

        isLoading = true
        errorMessage = nil

        do {

            _ = try await AuthenticationManager.shared.signInWithGoogle()

            didLogin = true

        } catch {

            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    // MARK: - Forgot Password

    func forgotPassword() {

        guard !email.isEmpty else {
            errorMessage = "Please enter your email first."
            return
        }

        Task {
            do {
                try await AuthenticationManager.shared.resetPassword(email: email)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
    }
}
//
//@MainActor
//final class LoginViewModel: ObservableObject {
//
//    @Published var email: String = ""
//    @Published var password: String = ""
//
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String?
//
//    func login() {
//
//        guard !email.isEmpty, !password.isEmpty else {
//            errorMessage = "Please enter your email and password."
//            return
//        }
//
//        isLoading = true
//        errorMessage = nil
//
//        Task {
//            do {
//                try await AuthenticationManager.shared.signInUser(
//                    email: email,
//                    password: password
//                )
//                // navigate on success, e.g. appState.route = .home
//            } catch {
//                errorMessage = error.localizedDescription
//            }
//
//            isLoading = false
//        }
//
//    }
//
//    func forgotPassword() {
//
//        guard !email.isEmpty else {
//            errorMessage = "Enter your email first, then tap this again."
//            return
//        }
//
//        Task {
//            do {
//                try await AuthenticationManager.shared.resetPassword(email: email)
//            } catch {
//                errorMessage = error.localizedDescription
//            }
//        }
//
//    }
//
//}
