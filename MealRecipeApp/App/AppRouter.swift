//
//  AppRouter.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import Foundation
import SwiftUI
import Combine



struct AppRouter: View {

    @StateObject private var appState = AppState()

    var body: some View {

        Group {

            switch appState.route {

            case .splash:
                SplashView()

            case .login:
                LoginView()

            case .register:
                RegisterView()

            case .home:
                MainTabView()

            }

        }
        .environmentObject(appState)

    }

}

//struct AppRouter: View {
//
//    @StateObject private var appState = AppState()
//
//    var body: some View {
//        Group {
//            switch appState.route {
//
//            case .splash:
//                SplashView()
//
//            case .login:
//                LoginView()
//
//            case .register:
//                RegisterView()
//
//            case .home:
//                HomeView()
//            }
//        }
//        .environmentObject(appState)
//    }
//}
