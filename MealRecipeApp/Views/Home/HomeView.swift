//
//  HomeView.swift
//  MealRecipeApp
//
//  Created by RASHID on 08/07/2026.
//

import SwiftUI
import Combine

struct HomeView: View {

    @StateObject
    private var viewModel = HomeViewModel()
    
    @Binding var selectedTab: TabItem

    var body: some View {

        NavigationStack {

            ScrollView(showsIndicators: false) {

                VStack(alignment: .leading, spacing: 24) {

                    //MARK: Header
                    HomeHeader(
                        userName: viewModel.userName,
                        photoURL: viewModel.photoURL,
                        onNotificationTap: {

                        },
                        onProfileTap: {

                            selectedTab = .profile

                        }
                    )

                    //MARK: Search Bar
                    SearchBar(
                        text: $viewModel.searchText
                    ) {
                        viewModel.searchMeals()
                    }

                    //MARK: Category Section
                    CategorySection(
                        categories: viewModel.categories
                    ) { category in
                        viewModel.selectCategory(category)
                    }

                    if let meal = viewModel.featuredMeal {
                        FeaturedMealCard(meal: meal)
                    }
                    
                    //MARK: Latest Recipes

                    LatestMealSection(
                        meals: viewModel.latestMeals
                    )

                }
                .padding()

            }
            .navigationBarHidden(true)
            .task {
                viewModel.loadHomeData()
            }

        }

    }

}
 

#Preview {
    HomeView(selectedTab: .constant(.home))
}
