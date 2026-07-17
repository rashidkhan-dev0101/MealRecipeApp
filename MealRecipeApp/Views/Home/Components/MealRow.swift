

import SwiftUI
import Combine


struct MealRow: View {

    let meal: Meal

    var body: some View {

        HStack(spacing: 15) {

            AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in

                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {

                ProgressView()

            }
            .frame(width: 95, height: 95)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 8) {

                Text(meal.strMeal)
                    .font(.headline)
                    .lineLimit(2)

                if let category = meal.strCategory {

                    Label(category, systemImage: "fork.knife")
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                }

                if let area = meal.strArea {

                    Label(area, systemImage: "globe")
                        .font(.subheadline)
                        .foregroundStyle(.gray)

                }

            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)

        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 22))

    }

}

#Preview {

    MealRow(
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
