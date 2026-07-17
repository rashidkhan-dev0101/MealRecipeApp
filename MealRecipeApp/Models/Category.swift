//
//  Category.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation

struct MealCategory: Codable, Identifiable {

    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String

    var id: String {
        idCategory
    }
}
