//
//  TabItem.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//

import Foundation


enum TabItem: String, CaseIterable {

    case home
    case search
    case favorites
    case profile

    var title: String {

        switch self {

        case .home:
            return "Home"

        case .search:
            return "Search"

        case .favorites:
            return "Favorites"

        case .profile:
            return "Profile"

        }

    }

    var icon: String {

        switch self {

        case .home:
            return "house.fill"

        case .search:
            return "magnifyingglass"

        case .favorites:
            return "heart"

        case .profile:
            return "person"

        }

    }

}
