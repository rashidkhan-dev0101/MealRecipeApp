//
//
//import Foundation
//import Combine
//
//@MainActor
//final class HomeViewModel: ObservableObject {
//
//    @Published var categories: [MealCategory] = []
//    @Published var latestMeals: [Meal] = []
//    @Published var featuredMeal: Meal?
//
//    @Published var selectedCategory: MealCategory?
//    @Published var searchText = ""
//
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//    
//    @Published var userName = ""
//    @Published var photoURL: URL?
//
//    // MARK: - Load Home Data
//    
//    func loadHomeData() {
//
//        isLoading = true
//        errorMessage = nil
//
//        Task {
//
//            do {
//
//                categories = try await MealService.shared.fetchCategories()
//
//                if let firstCategory = categories.first {
//
//                    selectedCategory = firstCategory
//
//                    latestMeals = try await MealService.shared.fetchMealsByCategory(
//                        firstCategory.strCategory
//                    )
//
//                }
//
//                featuredMeal = try await MealService.shared.fetchRandomMeal()
//
//            } catch {
//
//                errorMessage = error.localizedDescription
//
//            }
//
//            isLoading = false
//        }
//    }
//
//
//
//
//    // MARK: - Category Selection
//
//    func selectCategory(_ category: MealCategory) {
//
//        selectedCategory = category
//
//        isLoading = true
//
//        Task {
//
//            do {
//
//                latestMeals = try await MealService.shared.fetchMealsByCategory(
//                    category.strCategory
//                )
//
//            } catch {
//
//                errorMessage = error.localizedDescription
//
//            }
//
//            isLoading = false
//        }
//    }
//
//    // MARK: - Search
//
//    func searchMeals() {
//
//        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        guard !query.isEmpty else {
//            loadHomeData()
//            return
//        }
//
//        isLoading = true
//        errorMessage = nil
//
//        Task {
//
//            do {
//
//                latestMeals = try await MealService.shared.searchMeals(query: query)
//
//            } catch {
//
//                errorMessage = error.localizedDescription
//
//            }
//
//            isLoading = false
//        }
//    }
//
//}

//
//  HomeViewModel.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - User

    @Published var userName: String = "User"
    @Published var photoURL: URL?

    // MARK: - Meals

    @Published var categories: [MealCategory] = []
    @Published var latestMeals: [Meal] = []
    @Published var featuredMeal: Meal?

    // MARK: - UI

    @Published var selectedCategory: MealCategory?
    @Published var searchText: String = ""

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // MARK: - Load Home

    func loadHomeData() {

        loadCurrentUser()

        isLoading = true
        errorMessage = nil

        Task {

            do {

                async let categoriesTask = MealService.shared.fetchCategories()
                async let featuredTask = MealService.shared.fetchRandomMeal()

                let fetchedCategories = try await categoriesTask

                categories = fetchedCategories

                if let firstCategory = fetchedCategories.first {

                    selectedCategory = firstCategory

                    latestMeals = try await MealService.shared.fetchMealsByCategory(
                        firstCategory.strCategory
                    )

                }

                featuredMeal = try await featuredTask

            } catch {

                errorMessage = error.localizedDescription

            }

            isLoading = false

        }

    }

    // MARK: - Current User

    private func loadCurrentUser() {

        guard let user = AuthenticationManager.shared.getUserProfile() else {
            return
        }

        userName = user.name

        if let photo = user.photoURL {
            photoURL = URL(string: photo)
        } else {
            photoURL = nil
        }

    }

    // MARK: - Category

    func selectCategory(_ category: MealCategory) {

        selectedCategory = category

        isLoading = true
        errorMessage = nil

        Task {

            do {

                latestMeals = try await MealService.shared.fetchMealsByCategory(
                    category.strCategory
                )

            } catch {

                errorMessage = error.localizedDescription

            }

            isLoading = false

        }

    }

    // MARK: - Search

    func searchMeals() {

        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !query.isEmpty else {

            loadHomeData()
            return

        }

        isLoading = true
        errorMessage = nil

        Task {

            do {

                latestMeals = try await MealService.shared.searchMeals(
                    query: query
                )

            } catch {

                errorMessage = error.localizedDescription

            }

            isLoading = false

        }

    }

}
