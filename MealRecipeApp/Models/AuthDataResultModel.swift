//
//  AuthDataResultModel.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

//
//  AuthDataResultModel.swift
//  RecipeHub
//
//  Created by Apple Orchard on 07/07/2026.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {

    let uid: String
    let email: String?
    let photoURL: String?

    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}
