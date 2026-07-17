//
//  ProfileView.swift
//  MealRecipeApp
//
//  Created by RASHID on 12/07/2026.
//


import SwiftUI

struct ProfileView: View {

    @EnvironmentObject
    private var appState: AppState

    @StateObject
    private var viewModel = ProfileViewModel()

    @State
    private var showLogoutAlert = false

    var body: some View {

        NavigationStack {

            ScrollView(showsIndicators: false) {

                VStack(spacing: 30) {

                    // MARK: - Profile Header

                    ProfileHeader(
                        name: viewModel.name,
                        email: viewModel.email,
                        photoURL: viewModel.photoURL
                    ) {

                        print("Change Profile Photo")

                    }

                    // MARK: - Menu

                    VStack(spacing: 16) {

                        ProfileMenuRow(
                            icon: "person.crop.circle.fill",
                            title: "Edit Profile"
                        ) {

                            // Navigate to Edit Profile

                        }

                        ProfileMenuRow(
                            icon: "heart.fill",
                            title: "My Favorites"
                        ) {

                            // Navigate to Favorites

                        }

                        ProfileMenuRow(
                            icon: "bell.fill",
                            title: "Notifications"
                        ) {

                            // Navigate to Notifications

                        }

                        ProfileMenuRow(
                            icon: "gearshape.fill",
                            title: "App Settings"
                        ) {

                            // Navigate to Settings

                        }

                        ProfileMenuRow(
                            icon: "questionmark.circle.fill",
                            title: "Help & Support"
                        ) {

                            // Navigate to Help

                        }

                        ProfileMenuRow(
                            icon: "info.circle.fill",
                            title: "About App"
                        ) {

                            // Navigate to About

                        }

                    }

                    // MARK: - Logout Button

                    LogoutButton {

                        showLogoutAlert = true

                    }

                }
                .padding()

            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(
            "Log Out",
            isPresented: $showLogoutAlert
        ) {

            Button("Cancel", role: .cancel) { }

            Button("Log Out", role: .destructive) {

                do {

                    try viewModel.logout()

                    appState.route = .login

                } catch {

                    print(error.localizedDescription)

                }

            }

        } message: {

            Text("Are you sure you want to log out?")

        }

    }

}

#Preview {

    ProfileView()
        .environmentObject(AppState())

}
