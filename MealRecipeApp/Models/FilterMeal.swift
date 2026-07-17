//
//  FilterMeal.swift.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import Foundation
import Foundation

struct FilterMeal: Codable, Identifiable {

    let idMeal: String
    let strMeal: String
    let strMealThumb: String

    var id: String {
        idMeal
    }
}
