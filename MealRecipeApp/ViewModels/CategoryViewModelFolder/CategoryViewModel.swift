////
////  CategoryViewModel.swift
////  MealRecipeApp
////
////  Created by RASHID on 11/07/2026.
////
//
//import Foundation
//import Combine
//
//@MainActor
//final class CategoryViewModel: ObservableObject {
//
//    @Published var categories: [MealCategory] = []
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//
//    private let mealService = MealService.shared
//
//    func fetchCategories() {
//
//        Task {
//
//            isLoading = true
//
//            defer {
//                isLoading = false
//            }
//
//            do {
//
//                let categories = try await mealService.fetchCategories()
//
//                self.categories = categories.sorted {
//                    $0.strCategory < $1.strCategory
//                }
//
//            } catch {
//
//                errorMessage = error.localizedDescription
//
//            }
//
//        }
//
//    }
//
//}

import Foundation
import Combine

@MainActor
final class CategoryViewModel: ObservableObject {

    @Published var categories: [MealCategory] = []

    @Published var searchText = ""

    @Published var isLoading = false

    @Published var errorMessage: String?

    private let mealService = MealService.shared

    var filteredCategories: [MealCategory] {

        if searchText.isEmpty {

            return categories

        }

        return categories.filter {

            $0.strCategory.localizedCaseInsensitiveContains(searchText)

        }

    }

    func fetchCategories() {

        Task {

            isLoading = true

            defer {

                isLoading = false

            }

            do {

                categories = try await mealService.fetchCategories()

            }

            catch {

                errorMessage = error.localizedDescription

            }

        }

    }

}
