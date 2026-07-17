//
//  LatestMealSection.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import SwiftUI
import Combine



struct LatestMealSection: View {

    let meals: [Meal]

    var body: some View {

        VStack(alignment: .leading, spacing: 18) {

            HStack {

                Text("Latest Recipes")
                    .font(.title2.bold())

                Spacer()

                Button("See All") {

                }
                .foregroundStyle(.orange)

            }

            LazyVStack(spacing: 16) {

                ForEach(meals) { meal in

                    MealRow(meal: meal)

                }

            }

        }

    }

}

#Preview {

    LatestMealSection(meals: [])

}
