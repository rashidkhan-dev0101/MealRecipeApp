

import SwiftUI

struct MainTabView: View {

    @State private var selectedTab: TabItem = .home

    var body: some View {

        TabView(selection: $selectedTab) {

            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.icon)
                }
                .tag(TabItem.home)

            SearchView()
                .tabItem {
                    Label(TabItem.search.title, systemImage: TabItem.search.icon)
                }
                .tag(TabItem.search)

            FavoritesView()
                .tabItem {
                    Label(TabItem.favorites.title, systemImage: TabItem.favorites.icon)
                }
                .tag(TabItem.favorites)

            ProfileView()
                .tabItem {
                    Label(TabItem.profile.title, systemImage: TabItem.profile.icon)
                }
                .tag(TabItem.profile)

        }
        .tint(.orange)
    }
}
