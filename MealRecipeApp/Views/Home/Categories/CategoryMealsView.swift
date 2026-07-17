//
//  CategoryMealsView.swift
//  MealRecipeApp
//
//  Created by RASHID on 17/07/2026.
//

import SwiftUI


struct CategoryMealsView: View {

    let category: MealCategory

    var body: some View {

        Text(category.strCategory)

            .font(.largeTitle.bold())

            .navigationTitle(category.strCategory)

    }

}
