//
//  FeaturedMealCard.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import SwiftUI
import Combine



struct FeaturedMealCard: View {

    let meal: Meal

    var body: some View {

        ZStack(alignment: .bottomLeading) {

            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in

                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {

                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

            }
            .frame(height: 260)
            .clipped()

            LinearGradient(
                colors: [
                    .clear,
                    .black.opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 10) {

                HStack {

                    Text("⭐ Featured")
                        .font(.caption.weight(.semibold))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())

                    Spacer()

                    Button {

                    } label: {

                        Image(systemName: "heart")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .frame(width: 42, height: 42)
                            .background(.black.opacity(0.25))
                            .clipShape(Circle())

                    }

                }

                Spacer()

                Text(meal.strMeal)
                    .font(.title2.bold())
                    .foregroundStyle(.white)

                HStack(spacing: 15) {

                    if let category = meal.strCategory {

                        Label(category, systemImage: "fork.knife")
                    }

                    if let area = meal.strArea {

                        Label(area, systemImage: "globe")
                    }

                }
                .font(.footnote)
                .foregroundStyle(.white.opacity(0.9))

            }
            .padding(20)

        }
        .frame(height: 260)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(
            color: .black.opacity(0.15),
            radius: 12,
            x: 0,
            y: 8
        )

    }

}

#Preview {

    FeaturedMealCard(
        meal: Meal(
            idMeal: "52772",
            strMeal: "Teriyaki Chicken Casserole",
            strCategory: "Chicken",
            strArea: "Japanese",
            strInstructions: nil,
            strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
            strYoutube: nil
        )
    )
    .padding()

}
