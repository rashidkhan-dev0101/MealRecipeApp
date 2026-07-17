//
//  CategoryChip.swift.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import SwiftUI
import Combine



struct CategoryChip: View {

    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(isSelected ? .white : .primary)
                .padding(.horizontal, 18)
                .padding(.vertical, 12)
                .background(
                    isSelected
                    ? Color.orange
                    : Color(.systemGray6)
                )
                .clipShape(Capsule())

        }
        .buttonStyle(.plain)

    }

}

#Preview {

    VStack(spacing: 20) {

        CategoryChip(
            title: "Chicken",
            isSelected: true
        ) { }

        CategoryChip(
            title: "Seafood",
            isSelected: false
        ) { }

    }

    .padding()

}
