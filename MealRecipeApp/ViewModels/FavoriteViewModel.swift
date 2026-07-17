//
//  FavoriteViewModel.swift
//  MealRecipeApp
//
//  Created by RASHID on 11/07/2026.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class FavoriteViewModel: ObservableObject {

    @Published var favorites: [FavoriteMeal] = []

    private let key = "favorite_meals"

    init() {
        loadFavorites()
    }

    // MARK: Load

    func loadFavorites() {

        guard
            let data = UserDefaults.standard.data(forKey: key),
            let meals = try? JSONDecoder().decode([FavoriteMeal].self, from: data)
        else {

            favorites = []
            return

        }

        favorites = meals

    }

    // MARK: Save

    private func saveFavorites() {

        if let data = try? JSONEncoder().encode(favorites) {

            UserDefaults.standard.set(data, forKey: key)

        }

    }

    // MARK: Add

    func add(category: MealCategory) {

        let meal = FavoriteMeal(
            id: category.idCategory,
            title: category.strCategory,
            image: category.strCategoryThumb
        )

        guard !favorites.contains(where: {$0.id == meal.id}) else {
            return
        }

        favorites.append(meal)

        saveFavorites()

    }

    // MARK: Remove

    func remove(category: MealCategory) {

        favorites.removeAll {

            $0.id == category.idCategory

        }

        saveFavorites()

    }

    // MARK: Toggle

    func toggle(category: MealCategory) {

        if isFavorite(category) {

            remove(category: category)

        } else {

            add(category: category)

        }

    }

    // MARK: Check

    func isFavorite(_ category: MealCategory) -> Bool {

        favorites.contains {

            $0.id == category.idCategory

        }

    }

}
