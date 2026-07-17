//
//  SplashViewModel.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//


import Foundation
import Combine


final class SplashViewModel: ObservableObject {

    func checkAuthentication(
        completion: @escaping (Bool) -> Void
    ) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            let isLoggedIn =
                AuthenticationManager.shared.getCurrentUser() != nil

            completion(isLoggedIn)

        }

    }

}
