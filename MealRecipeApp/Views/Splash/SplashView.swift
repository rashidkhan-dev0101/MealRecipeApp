//
//  SplashView.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import SwiftUI
import Combine

struct SplashView: View {

    @EnvironmentObject
    private var appState: AppState

    @StateObject
    private var viewModel = SplashViewModel()

    var body: some View {

        ZStack {

            Color.white
                .ignoresSafeArea()

            VStack(spacing: 18) {

                Image(systemName: "fork.knife.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(.orange)

                Text("Meal Recipe")
                    .font(.largeTitle.bold())

                ProgressView()

            }

        }
        .onAppear {

            viewModel.checkAuthentication { loggedIn in

                appState.route = loggedIn ? .home : .login

            }

        }

    }

}
