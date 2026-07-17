//
//  AppState.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//


import SwiftUI
import Combine

@MainActor
final class AppState: ObservableObject {

    enum Route {
        case splash
        case login
        case register
        case home
    }

    @Published var route: Route = .splash
}
