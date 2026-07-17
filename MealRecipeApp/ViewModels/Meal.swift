//
//  Meal.swift.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import Foundation
//
//  Meal.swift
//  MealRecipeApp
//


struct Meal: Codable, Identifiable {

    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strYoutube: String?

    var id: String {
        idMeal
    }
}
