//
//  MealService.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation
import Combine

final class MealService {

    static let shared = MealService()

    private let networkManager = NetworkManager.shared

    private init() {}

    // MARK: - Categories

    func fetchCategories() async throws -> [MealCategory] {

        let response = try await networkManager.request(
            endpoint: .categories,
            type: CategoryResponse.self
        )

        return response.categories
    }

    // MARK: - Latest Meals

    func fetchLatestMeals() async throws -> [Meal] {

        let response = try await networkManager.request(
            endpoint: .latest,
            type: MealResponse.self
        )

        return response.meals
    }

    // MARK: - Random Meal

    func fetchRandomMeal() async throws -> Meal? {

        let response = try await networkManager.request(
            endpoint: .random,
            type: MealResponse.self
        )

        return response.meals.first
    }

    // MARK: - Search Meals

    func searchMeals(query: String) async throws -> [Meal] {

        let response = try await networkManager.request(
            endpoint: .search(query),
            type: MealResponse.self
        )

        return response.meals
    }

    // MARK: - Meal Details

    func fetchMealDetails(id: String) async throws -> Meal? {

        let response = try await networkManager.request(
            endpoint: .mealDetail(id),
            type: MealResponse.self
        )

        return response.meals.first
    }

    // MARK: - Meals By Category

    func fetchMealsByCategory(_ category: String) async throws -> [Meal] {

        let response = try await networkManager.request(
            endpoint: .mealsByCategory(category),
            type: MealResponse.self
        )

        return response.meals
    }
}
