////
////  CategorySection.swift
////  MealRecipeApp
////
////  Created by RASHID on 11/07/2026.
////
//
//import SwiftUI
//
//struct CategorySection: View {
//
//    let categories: [MealCategory]
//
//    @State private var selectedCategory: String?
//
//    var body: some View {
//
//        VStack(alignment: .leading, spacing: 18) {
//
//            HStack {
//
//                Text("Categories")
//                    .font(.title2.bold())
//
//                Spacer()
//
//                Button("See All") {
//
//                }
//                .font(.subheadline)
//                .foregroundStyle(.orange)
//
//            }
//
//            ScrollView(.horizontal, showsIndicators: false) {
//
//                HStack(spacing: 12) {
//
//                    ForEach(categories) { category in
//
//                        CategoryChip(
//                            title: category.strCategory,
//                            isSelected: selectedCategory == category.strCategory
//                        ) {
//                            selectedCategory = category.strCategory
//                        }
//
//                    }
//
//                }
//
//            }
//
//        }
//
//    }
//}
//
//#Preview {
//    CategorySection(categories: [])
//}

import SwiftUI

struct CategorySection: View {

    let categories: [MealCategory]
    let onCategorySelected: (MealCategory) -> Void

    @State private var selectedCategory: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 18) {

            HStack {

                Text("Categories")
                    .font(.title2.bold())

                Spacer()

                Button("See All") { }
                    .foregroundStyle(.orange)

            }

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 12) {

                    ForEach(categories) { category in

                        CategoryChip(
                            title: category.strCategory,
                            isSelected: selectedCategory == category.strCategory
                        ) {

                            selectedCategory = category.strCategory
                            onCategorySelected(category)

                        }

                    }

                }

            }

        }

    }

}
